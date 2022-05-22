class GameTurnsController < ApplicationController
    def update
        # TODO: Grab all the players in the room currently and figure out a mechanism to iterate
        # the indices in the array. Patch the database with the new number
        player_ids = []
        @players = Groupparticipant.where(room_id: params["room_id"])
        @players.each do |p|
            player_ids.append(p.user_id)
        end
        
    end
end