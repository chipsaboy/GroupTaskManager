class CreateTaskTags < ActiveRecord::Migration[5.1]
  def change
    create_table :task_tags do |t|
      t.belongs_to :task, foreign_key: true
      t.belongs_to :tag, foreign_key: true
    end
  end
end
