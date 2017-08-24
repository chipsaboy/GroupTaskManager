class CreateUserTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tasks do |t|
      t.string :user_id
      t.string :task_id
      t.timestamps null: false
    end
  end
end
