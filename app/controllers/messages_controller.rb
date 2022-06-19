class MessagesController < ApplicationController
    def create
        @current_user = current_user
        msg_content = msg_params[:content]
        room_category = Room.find(params[:room_id]).category    
        
        if room_category == "Famous Foursomes"
            list_of_answers = FamousFoursomesCategoryAnswer.where(room_id: params[:room_id])
            status = "none"
            for i in 0..7 do
                if msg_content == list_of_answers[i].answer 
                    if list_of_answers[i].been_said == false
                        status = "good"
                        break
                    else
                        status = "said"
                        break
                    end
                else
                    status = "not"
                end
            end

            if status == "good"
                list_of_answers[i].update(been_said: true)
                msg_content = msg_content + " " + "(Good!)"
                @message = @current_user.messages.create(content: msg_content, room_id: params[:room_id])
            elsif status == "said"
                msg_content = msg_content + " " + "(Word Has Already Been Said!)"
                @message = @current_user.messages.create(content: msg_content, room_id: params[:room_id])
            else
                msg_content = msg_content + " " + "(Not A Word, Try Again!)"
                @message = @current_user.messages.create(content: msg_content, room_id: params[:room_id])
            end
        elsif room_category == "Black White Animals"
            list_of_answers = BlackAndWhiteAnimalsCategoryAnswer.where(room_id: params[:room_id])
            status = "none"
            for i in 0..6 do
                if msg_content == list_of_answers[i].answer 
                    if list_of_answers[i].been_said == false
                        status = "good"
                        break
                    else
                        status = "said"
                        break
                    end
                else
                    status = "not"
                end
            end

            if status == "good"
                list_of_answers[i].update(been_said: true)
                msg_content = msg_content + " " + "(Good!)"
                @message = @current_user.messages.create(content: msg_content, room_id: params[:room_id])
            elsif status == "said"
                msg_content = msg_content + " " + "(Word Has Already Been Said!)"
                @message = @current_user.messages.create(content: msg_content, room_id: params[:room_id])
            else
                msg_content = msg_content + " " + "(Not A Word, Try Again!)"
                @message = @current_user.messages.create(content: msg_content, room_id: params[:room_id])
            end
        else
        end
    end

    private

    def msg_params
        params.require(:message).permit(:content)
    end
end