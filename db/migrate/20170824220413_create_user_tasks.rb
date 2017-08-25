class CreateUserTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tasks do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :task, foreign_key: true
      t.timestamps null: false
    end
  end
end
