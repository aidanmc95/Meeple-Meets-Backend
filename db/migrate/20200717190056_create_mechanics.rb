class CreateMechanics < ActiveRecord::Migration[6.0]
  def change
    create_table :mechanics do |t|
      t.string :mechanic

      t.timestamps
    end
  end
end
