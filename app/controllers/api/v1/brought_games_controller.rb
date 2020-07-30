class Api::V1::BroughtGamesController < ApplicationController
    def create
        user = User.find_by(id: user_id)
        meet = Meet.find(brought_params[:meet_id])
        invite = meet.invites.find{|invite| ((invite.user == user) && invite.status)}
        if(meet)
            if user && logged_in?
                my_game = user.my_games.select {|my_game| my_game.boardgame_id == params[:boardgame_id]}[0]
                if((meet.user == user || invite) && my_game) 
                    brought_game = BroughtGame.new(my_game: my_game, meet: meet)
                    if brought_game.valid?
                        brought_game.save
                        render json: brought_game
                    else
                        render json: {error: brought_game.errors.full_messages }, status: 401
                    end
                else
                    render json: {error: 'Not Part of the Meet'}, status: 401
                end
            else
                render json: {error: 'Login to Continue'}, status: 401
            end
        else
            render json: {error: 'Meet Could Not be Found'}, status: 401
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {info: "Deleted"}
    end

    private

    def brought_params
        params.require(:brought_game).permit(:boardgame_id, :meet_id)
    end
end
