class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :state, null: false, default: 0
      t.timestamps null: false
    end
  end
end
