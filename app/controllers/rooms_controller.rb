class RoomsController < ApplicationController
  def index
      @current_user = current_user
      redirect_to '/signin' unless @current_user
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
    @room = Room.create(name: params["room"]["name"], user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @users = User.all_except(@current_user)

    # Joining or leaving a group
    @groupparticipant = Groupparticipant.new
    @is_groupparticipant = Groupparticipant.where(user_id: current_user, room_id: @single_room.id).exists?
    @is_groupcreator = Room.where(user_id: current_user).exists?
    
    # Showing names of group members
    @groupparticipants = Groupparticipant.where(room_id: @single_room.id)
    group_user_ids = []
    @groupparticipants.each do |groupparticipant|
      group_user_ids.append(groupparticipant.user_id)
    end
    @groupparticipants = User.where(id: group_user_ids)

    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages

    render "room"
  end

  def destroy
    @room = Room.find(params["id"])
    @room.destroy
    
    redirect_to root_url
  end

  def update
    # check if room has mininimum number of required players (2)
    @groupparticipants = Groupparticipant.where(room_id: params["room_id"])
    group_user_ids = []
    @groupparticipants.each do |groupparticipant|
      group_user_ids.append(groupparticipant.user_id)
    end
    @groupparticipants = User.where(id: group_user_ids)
    @groupparticipants = @groupparticipants.count

    if params["state"] == "true" # meaning request is trying to start the game
      if @groupparticipants >= 2
        @room = Room.find(params["room_id"])
        @room.update(is_active: params["state"])
        redirect_back(fallback_location: root_path)

      else
        flash.alert= "Not enough players"
        redirect_back(fallback_location: root_path)
      end
    else # request is trying to end the game
      @room = Room.find(params["id"])
      @room.update(is_active: params["state"])
      redirect_back(fallback_location: root_path)
    end
  end
end