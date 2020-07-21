class Api::V1::UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        if user
            render json: user, serializer: SimpleUserSerializer
          else
            render json: {error: 'That user could not be found'}, status: 401
          end
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = issue_token(@user)
            render json: { user: @user, jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
