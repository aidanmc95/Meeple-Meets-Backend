class CreateBroughtGames < ActiveRecord::Migration[6.0]
  def change
    create_table :brought_games do |t|
      t.belongs_to :my_game, null: false, foreign_key: true
      t.belongs_to :meet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
