class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :deadline
      t.boolean :completed
      t.integer :position
      t.references :todo_list, index: true

      t.timestamps
    end
  end
end
