class Api::V1::AuthController < ApplicationController
  # Login
  def create
    user = User.find_by(username: auth_params[:username])
    if user && user.authenticate(auth_params[:password])
      # issue that user a token\
      token = issue_token(user)
      render json: {id: user.id, username: user.username, jwt: token}
    else
      render json: {error: 'That user could not be found'}, status: 401
    end
  end

  def show
    user = User.find_by(id: user_id)
    if user && logged_in?
      render json: { id: user.id, username: user.username }
    else
      render json: {error: 'No user could be found'}, status: 401
    end
  end

  private

    def auth_params
        params.require(:auth).permit(:username, :password)
    end
end
