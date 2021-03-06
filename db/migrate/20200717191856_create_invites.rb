class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :meet, null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
