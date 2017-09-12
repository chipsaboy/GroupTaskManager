class Tag < ApplicationRecord
	validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only letters allowed" }, length: { maximum: 20 }
	has_many :task_tags
	has_many :tasks, through: :task_tags
end
