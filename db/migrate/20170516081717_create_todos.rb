class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :descr
      t.string :priority
      t.boolean :completed

      t.timestamps
    end
  end
end
