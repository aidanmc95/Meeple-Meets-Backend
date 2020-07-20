class MeetsController < ApplicationController
    def index
        meets = User.all
        render json: meets.to_json()
    end
    
    def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user)
    end

    def create
        user = User.create(user_params)
        render json: UserSerializer.new(user)
    end

    def edit
        user = User.find(params[:id])
        user.update(user_params)
        render json: UserSerializer.new(user)
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {info: "Deleted"}
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
