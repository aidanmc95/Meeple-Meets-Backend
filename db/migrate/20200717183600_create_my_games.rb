class CreateMyGames < ActiveRecord::Migration[6.0]
  def change
    create_table :my_games do |t|
      t.belongs_to :boardgames, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
