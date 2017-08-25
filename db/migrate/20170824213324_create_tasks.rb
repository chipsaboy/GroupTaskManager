class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :state, null: false, default: 0
      t.datetime :due_date
      t.timestamps null: false
    end
  end
end
