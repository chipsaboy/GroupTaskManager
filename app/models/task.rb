class Task < ApplicationRecord
  belongs_to :list
  has_many :task_tags
  has_many :tags, through: :task_tags
  has_many :user_tasks
  has_many :users, through: :user_tasks
  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :user_tasks

  def tags_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.tags << tag
    end
  end
end
