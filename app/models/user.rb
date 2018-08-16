class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 70 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_tasks
  has_many :lists, dependent: :destroy
  has_many :tasks, through: :user_tasks, dependent: :destroy

  private

  def email_required?
    super && provider.blank?
  end
end
