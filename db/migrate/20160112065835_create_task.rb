class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
        t.text :body
        t.string :priority
      	t.timestamps null: false
    end
  end
end
