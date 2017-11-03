class ListSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :user, serializer: ListUserSerializer
  has_many :tasks, serializer: TaskSerializer
end
