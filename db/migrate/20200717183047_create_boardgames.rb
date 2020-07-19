class CreateBoardgames < ActiveRecord::Migration[6.0]
  def change
    create_table :boardgames do |t|
      t.integer :BGGid
      t.string :title
      t.string :description
      t.string :thumbnail
      t.string :image
      t.string :playtime
      t.string :minplayers
      t.string :maxplayers
      t.string :BGGrating

      t.timestamps
    end
  end
end
