class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :due_date, :list_id
  belongs_to :users, serializer: TaskUserSerializer
  has_many :tags, serializer: TagSerializer
end
