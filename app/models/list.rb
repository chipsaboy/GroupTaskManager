class List < ApplicationRecord
	has_many :tasks
	has_many :user_lists
	has_many :users, through: :user_lists
	accept_nested_attributes_for :tasks
end
