class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :BGGusername
      t.string :address1
      t.string :address2
      t.integer :zip
      t.string :email
      t.string :about_me
      t.string :as_host

      t.timestamps
    end
  end
end
