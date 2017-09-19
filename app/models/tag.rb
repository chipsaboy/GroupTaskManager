class Tag < ApplicationRecord
	validates :name, uniqueness: { case_sensitive: false }
	has_many :task_tags
	has_many :tasks, through: :task_tags
end
