class CreateTaskTags < ActiveRecord::Migration[5.1]
  def change
    create_table :task_tags do |t|
      t.string :task_id
      t.string :tag_id
      t.timestamps null: false
    end
  end
end
