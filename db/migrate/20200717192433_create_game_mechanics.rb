class CreateGameMechanics < ActiveRecord::Migration[6.0]
  def change
    create_table :game_mechanics do |t|
      t.belongs_to :mechanic, null: false, foreign_key: true
      t.belongs_to :boardgame, null: false, foreign_key: true

      t.timestamps
    end
  end
end
