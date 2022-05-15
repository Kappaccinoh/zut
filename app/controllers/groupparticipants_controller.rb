class GroupparticipantsController < ApplicationController
    def create
        @groupparticipant = Groupparticipant.create(user_id: current_user.id , room_id: params["groupparticipant"]["room_id"])
    end

    def destroy
        @groupparticipant = Groupparticipant.where(user_id: params["user_id"], room_id: params["room_id"]).delete_all
    end
end