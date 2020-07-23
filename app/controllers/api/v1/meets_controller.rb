class Api::V1::MeetsController < ApplicationController
    def index
        meets = Meet.all
        render json: meets
    end
    
    def show
        meet = Meet.find(params[:id])
        render json: meet, include: ['user', 'brought_games', 'brought_games.boardgame', 'invites', 'invites.user']
    end

    def create
        user = User.find_by(id: user_id)
        if user && logged_in?
            meet = Meet.create(meet_params)
            render json: meet
        else
            render json: {error: 'No user could be found. Log In to Create Meet.'}, status: 401
        end
    end

    def edit
        user = User.find_by(id: user_id)
        if user && logged_in?
            meet = Meet.find(params[:id])
            if(meet.user == user)
                meet.update(meet_params)
                render json: meet
            else
                render json: {error: 'Incorrect User'}, status: 401
            end
        else
            render json: {error: 'No user could be found. Log In.'}, status: 401
        end
    end

    def destroy
        user = User.find_by(id: user_id)
        if user && logged_in?
            meet = Meet.find(params[:id])
            if(meet.user == user)
                meet.destroy
                render json: {info: "Deleted"}
            else
                render json: {error: 'Incorrect User'}, status: 401
            end
        else
            render json: {error: 'No user could be found. Log In.'}, status: 401
        end
    end

    private

    def meet_params
        params.require(:meet).permit(:user_id, :description, :location, :size, :name, :when)
    end
end
