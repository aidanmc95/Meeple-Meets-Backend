class CreateMeets < ActiveRecord::Migration[6.0]
  def change
    create_table :meets do |t|
      t.string :description
      t.string :location
      t.integer :zip
      t.string :size
      t.string :name
      t.datetime :when
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
