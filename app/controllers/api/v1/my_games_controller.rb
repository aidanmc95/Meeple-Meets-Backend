class Api::V1::MyGamesController < ApplicationController

    def create
        user = User.find_by(id: user_id)
        if user && logged_in?
            my_game = MyGame.create(my_game_params)
            render json: my_game, include: ['boardgame']
        else
            render json: {error: 'No user could be found. Log In to Create Meet.'}, status: 401
        end
    end

    def destroy
        user = User.find_by(id: user_id)
        if user && logged_in?
            my_game = MyGame.find(params[:id])
            if(my_game.user == user)
                my_game.destroy
                render json: {info: "Deleted"}
            else
                render json: {error: 'Incorrect User'}, status: 401
            end
        else
            render json: {error: 'No user could be found. Log In.'}, status: 401
        end
    end

    private

    def my_game_params
        params.require(:my_game).permit(:user_id, :boardgame_id)
    end
end
