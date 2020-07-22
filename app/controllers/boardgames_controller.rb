class BoardgamesController < ApplicationController
    def index
        boardgames = Boardgame.all
        render json: boardgames, each_serializer: SimpleBoardgameSerializer
    end
    
    def show
        boardgame = Boardgame.find(params[:id])
        # byebug
        render json: boardgame, serializer: BoardgameSerializer
    end

    def create
        boardgame = Boardgame.create(boardgame_params)
        render json: BoardgameSerializer.new(boardgame)
    end

    def edit
        boardgame = Boardgame.find(params[:id])
        boardgame.update(boardgame_params)
        render json: BoardgameSerializer.new(boardgame)
    end

    def destroy
        boardgame = Boardgame.find(params[:id])
        boardgame.destroy
        render json: {info: "Deleted"}
    end

    private

    def boardgame_params
        params.require(:boardgame).permit(:boardgamename, :title, :BGGid, :description, :thumbnail, :image, :playtime, :minplayers, :maxplayers, game_categories_attributes:[:category_id], game_mechanics_attributes:[:mechanic_id], game_publishers_attributes:[:publisher_id], game_designers_attributes:[:designer_id])
    end
end
