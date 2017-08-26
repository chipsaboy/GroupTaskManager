class Task < ApplicationRecord
  validates :list_id
  validates :name
  belongs_to :list
  has_many :tags
  has_many :user_tasks
  has_many :users, through: :user_tasks

  def tags_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.tags << tag
    end
  end

  def users_attributes=(user_attributes)
    user_attributes.values.each do |user_attribute|
      user = User.find_or_create_by(user_attribute)
      self.users << user
    end
  end

end
