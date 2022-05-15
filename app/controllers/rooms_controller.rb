class RoomsController < ApplicationController
  def index
      @current_user = current_user
      redirect_to '/signin' unless @current_user
      @rooms = Room.public_rooms
      @users = User.all_except(@current_user)
      @room = Room.new
  end

  def create
    @room = Room.create(name: params["room"]["name"], user_id: current_user.id)
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)

    # Joining or leaving a group
    @groupparticipant = Groupparticipant.new
    @is_groupparticipant = Groupparticipant.where(user_id: current_user, room_id: @single_room.id).exists?
    
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
end
