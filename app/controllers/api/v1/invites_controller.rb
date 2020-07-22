class Api::V1::InvitesController < ApplicationController

    def create
        user = User.find_by(id: user_id)
        if user && logged_in?
            invite = Invite.create(invite_params)
            render json: invite
        else
            render json: {error: 'No user could be found. Log In to Join Meet.'}, status: 401
        end
    end

    def edit
        invite = Invite.find(params[:id])
        invite.update(invite_params)
        render json: invite
    end

    def destroy
        invite = Invite.find(params[:id])
        invite.destroy
        render json: {info: "Deleted"}
    end

    private

    def invite_params
        params.require(:invite).permit(:user_id, :meet_id, :status)
    end
end
