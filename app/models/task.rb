class Task < ApplicationRecord
  validates :list_id, :name, presence: true, length: { maximum: 140 }
  belongs_to :list
  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags
  has_many :user_tasks
  has_many :users, through: :user_tasks, dependent: :destroy
  accepts_nested_attributes_for :tags, :reject_if => :all_blank
  accepts_nested_attributes_for :users

  default_scope { order(due_date: :desc) }

  def self.recent_tasks
    self.all.order(created_at: :desc)
  end

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
