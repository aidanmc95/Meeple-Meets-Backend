class MeetsController < ApplicationController
    def index
        meets = Meet.all
        render json: meets, each_serializer: MeetsSerializer
    end
    
    def show
        meet = Meet.find(params[:id])
        render json: meet, serializer: MeetsSerializer
    end

    def create
        user = User.create(user_params)
        render json: MeetsSerializer.new(user)
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
