class BoardgamesController < ApplicationController
    def index
        boardgames = BoardGame.all
        render json: boardgames.to_json()
    end
    
    def show
        boardgame = BoardGame.find(params[:id])
        render json: BoardgameSerializer.new(boardgame)
    end

    def create
        boardgame = BoardGame.create(boardgame_params)
        render json: BoardgameSerializer.new(boardgame)
    end

    def edit
        boardgame = BoardGame.find(params[:id])
        boardgame.update(boardgame_params)
        render json: BoardgameSerializer.new(boardgame)
    end

    def destroy
        boardgame = BoardGame.find(params[:id])
        boardgame.destroy
        render json: {info: "Deleted"}
    end

    private

    def boardgame_params
        params.require(:boardgame).permit(:boardgamename, :title, :BGGid, :description, :thumbnail, :image, :playtime, :minplayers, :maxplayers, game_categories_attributes:[:category_id], game_mechanics_attributes:[:mechanic_id], game_publishers_attributes:[:publisher_id], game_designers_attributes:[:designer_id])
    end
end
