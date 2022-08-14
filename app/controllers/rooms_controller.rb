class RoomsController < ApplicationController
  def index
      if current_user == nil
        redirect_to '/signin'
        return
      else 
        @current_user = current_user
      end
      @rooms = Room.all
      @rooms_open = Room.open_rooms
      @rooms_inprogress = Room.inprogress_rooms
      @users = User.all_except(@current_user)
      @room = Room.new

      # Rooms that a player has already joined
      @joined_rooms = Groupparticipant.where(user_id: current_user.id)
      joined_room_ids = []
      @joined_rooms.each do |joined_room|
        joined_room_ids.append(joined_room.room_id)
      end
      @joined_rooms = Room.where(id: joined_room_ids)
      @has_joined_rooms = @joined_rooms.exists?

      # Rooms that a player has created
      @created_rooms = Room.where(user_id: current_user.id)
      @has_created_rooms = @created_rooms.exists?

      
  end

  def create
    @room = Room.create(name: params['room']['name'], user_id: current_user.id)
    @groupparticipant = Groupparticipant.create(user_id: current_user.id, room_id: @room.id)
    redirect_back(fallback_location: root_path)
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @users = User.all_except(@current_user)

    # Joining or leaving a group
    @groupparticipant = Groupparticipant.new
    @is_groupparticipant = Groupparticipant.where(user_id: current_user, room_id: @single_room.id).exists?
    @is_groupcreator = Room.where(user_id: current_user, id: params[:id]).exists?
    
    # Showing names of group members
    @groupparticipants = Groupparticipant.where(room_id: @single_room.id)
    group_user_ids = []
    @groupparticipants.each do |groupparticipant|
      group_user_ids.append(groupparticipant.user_id)
    end
    @groupparticipants = User.where(id: group_user_ids)
    @only_one_groupparticipant if @groupparticipants.length == 1

    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages

    @current_player = GameTurn.where(room_id: @single_room.id)
    if @current_player.exists? # when you end the game, GameTurn entry doesnt exist, so @current_player[0] will not exist either // error prevention
      @current_player = @current_player[0]
      @current_player_username = @current_player.user.username
      @current_player_id = @current_player.user_id
    end

    
    game_mode = @single_room.game_mode
    if game_mode == "comp"
      @is_comp = true
    elsif game_mode == "coop"
      @is_coop = true
    end

    @timer_interval = @single_room.timer_interval

    render 'room'
  end

  def destroy
    @room = Room.find(params['id'])
    @room.destroy
    
    redirect_to root_url
  end

  def update
    # check if room has mininimum number of required players (2)
    @groupparticipants = Groupparticipant.where(room_id: params['room_id'])
    group_user_ids = []
    @groupparticipants.each do |groupparticipant|
      group_user_ids.append(groupparticipant.user_id)
    end
    @groupparticipants = User.where(id: group_user_ids)
    @groupparticipants = @groupparticipants.count

    if params['state'] == "true" # meaning request is trying to start the game
      if @groupparticipants >= 2
        @room = Room.find(params['room_id'])
        @room.update(is_active: params['state'])
        flash.alert = "Room in Progress"

        # create the GameTurn Table (only active games will have GameTurn entries)
        room_player_ids = []
        @room_players = Groupparticipant.where(room_id: params['room_id'])
        @room_players.each do |r|
          room_player_ids.append(r.user_id)
        end
        
        # note that the array that is entered into the the database is presorted, so 
        # future game changes will reuse the same array
        room_player_ids = room_player_ids.sort

        max_index = room_player_ids.length() - 1
        starting_player_index = rand(0..max_index)
        # creating gameturn entry
        @gameturn = GameTurn.create(
          user_id: room_player_ids[starting_player_index],
          room_id: params['room_id'],
          room_players: room_player_ids
        )

        # deleting all DATABASE_Category_Answers rows
        category = Room.find(params['room_id']).category
        if category == "Famous Foursomes"
          @category_answer_rows = FamousFoursomesCategoryAnswer.where(room_id: params['id']) # consider doing this depending on which category the game was previously
          @category_answer_rows.each do |c|
            c.destroy
          end
        elsif category == "Black White Animals"
          @category_answer_rows = BlackAndWhiteAnimalsCategoryAnswer.where(room: params['id']) # consider doing this depending on which category the game was previously
          @category_answer_rows.each do |c|
            c.destroy
          end
        else
        end
        
        # creating the DATABASE_Category_Answers rows, hard coded for now, consider doing it dynamically
        if params['category'] == "Famous Foursomes"
          # Updating the Room's Category Column (Again hardcoded for now)
          Room.find(params['room_id']).update(category: "Famous Foursomes")

          # Hard Coded for now (8 'template' entries), consider doing it dynamically
          for i in 1..8 do
            answer = FamousFoursomesCategoryAnswer.find(i).answer
            FamousFoursomesCategoryAnswer.create(room_id: params['room_id'], answer: answer)
          end
        
        elsif params['category'] == "Black White Animals"
          # Updating the Room's Category Column (Again hardcoded for now)
          Room.find(params['room_id']).update(category: "Black White Animals")

          # Hard Coded for now (7 'template' entries), consider doing it dynamically
          for i in 1..7 do
            answer = BlackAndWhiteAnimalsCategoryAnswer.find(i).answer
            BlackAndWhiteAnimalsCategoryAnswer.create(room_id: params['room_id'], answer: answer)
          end
        else
        end

        # populating the game_mode column with a string, again hardcoded for now
        if params['game_mode'] == "Competitive"
          Room.find(params['room_id']).update(game_mode: "comp")
        elsif params['game_mode'] == "Cooperative"
          Room.find(params['room_id']).update(game_mode: "coop")
        end

        # populating the timer_interval column with an integer
        if params['timer_interval'] == '5 seconds'
          Room.find(params['room_id']).update(timer_interval: 5)
        elsif params['timer_interval'] == '10 seconds'
          Room.find(params['room_id']).update(timer_interval: 10)
        elsif params['timer_interval'] == '15 seconds'
          Room.find(params['room_id']).update(timer_interval: 15)
        elsif params['timer_interval'] == '30 seconds'
          Room.find(params['room_id']).update(timer_interval: 30)
        end

        redirect_back(fallback_location: root_path)
      
      else # unable to start game
        flash.alert= "Not enough players"
        redirect_back(fallback_location: root_path)
      end
    
    else # request is trying to end the game
      @room = Room.find(params['room_id'])
      @room.update(is_active: params['state'])
      @room.update(game_mode: "")
      @room.update(category: "")

      # deleting all messages
      message = Message.where(room_id: params['room_id'])
      message.each do |m|
        m.delete
      end

      # deleting the GameTurn entry
      @gameturn = GameTurn.where(room_id: params['room_id']) # consider just using .find instead
      @gameturn.each do |g| 
        g.destroy
      end

      # deleting all DATABASE_Category_Answers rows
      category = Room.find(params['room_id']).category
      if category == "Famous Foursomes"
        @category_answer_rows = FamousFoursomesCategoryAnswer.where(room_id: params['id']) # consider doing this depending on which category the game was previously
        @category_answer_rows.each do |c|
          c.destroy
        end
      elsif category == "Black White Animals"
        @category_answer_rows = BlackAndWhiteAnimalsCategoryAnswer.where(room: params['id']) # consider doing this depending on which category the game was previously
        @category_answer_rows.each do |c|
          c.destroy
        end
      else
      end

      redirect_back(fallback_location: root_path)
    end
  end
end