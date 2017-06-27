class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :priority
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
