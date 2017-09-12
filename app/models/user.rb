class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 70 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :user_tasks
  has_many :lists, dependent: :destroy
  has_many :tasks, through: :user_tasks, dependent: :destroy

  private

  def self.from_omniauth(auth)
	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    if auth.info.email
	    user.email = auth.info.email
      user.name = "#{user.email[/^[^@]*/]}#{rand(1 .. 500)}"
    else
      user.name = "user#{rand(1 .. 999999)}"
    end
	  user.password = Devise.friendly_token[0,20]
    end
  end

  def email_required?
    super && provider.blank?
  end
end
