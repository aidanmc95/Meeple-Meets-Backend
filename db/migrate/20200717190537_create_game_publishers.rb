class CreateGamePublishers < ActiveRecord::Migration[6.0]
  def change
    create_table :game_publishers do |t|
      t.belongs_to :boardgame, null: false, foreign_key: true
      t.belongs_to :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
