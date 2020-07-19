class RatingsController < ApplicationController
    def index
        raatings = Rating.all
        render json: raatings.to_json()
    end
    
    def show
        rating = Rating.find(params[:id])
        render json: RatingsSerializer.new(rating)
    end

    def create
        rating = Rating.create(rating_params)
        render json: RatingsSerializer.new(rating)
    end

    def edit
        rating = Rating.find(params[:id])
        rating.update(rating_params)
        render json: RatingsSerializer.new(rating)
    end

    def destroy
        rating = Rating.find(params[:id])
        rating.destroy
        render json: {info: "Deleted"}
    end

    private

    def rating_params
        params.require(:rating).permit(:rating, :user_id, :boardgame_id)
    end
end
