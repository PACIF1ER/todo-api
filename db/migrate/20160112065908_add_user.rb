class AddUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :password_digest
      t.boolean :email_confirmation, default: false
      t.string :email_token
 
      t.timestamps null: false
    end
  end
end
