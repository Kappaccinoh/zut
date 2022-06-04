class GroupparticipantsController < ApplicationController
    def create
        if Groupparticipant.where(user_id: current_user.id, room_id: params['groupparticipant']['room_id']).exists?
            redirect_back(fallback_location: root_path)
        else
            @groupparticipant = Groupparticipant.create(user_id: current_user.id , room_id: params['groupparticipant']['room_id'])
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        @groupparticipant = Groupparticipant.where(user_id: params['user_id'], room_id: params['room_id']).delete_all
        redirect_back(fallback_location: root_path)
    end
end