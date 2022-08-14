class GameturnsController < ApplicationController
    def update
        @game_turn = GameTurn.where(room: params[:room_id])
        player_ids = @game_turn[0].room_players
        player_ids_length = player_ids.length

        new_index = 0
        for i in (0...player_ids_length)
            if player_ids[i] == @game_turn[0].user_id
                new_index = i + 1
            end
        end

        new_index = new_index % player_ids_length
        new_user_id = player_ids[new_index]

        @game_turn[0].update(user_id: new_user_id)

        redirect_to controller: :rooms, action: :show, id: Room.find(params[:room_id])
    end

end