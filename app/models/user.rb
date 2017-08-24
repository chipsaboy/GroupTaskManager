class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_lists
  has_many :user_tasks
  has_many :lists, through: :user_lists
  has_many :tasks, through: :user_tasks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]

  def self.from_omniauth(auth)
	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	  user.email = auth.info.email
	  user.password = Devise.friendly_token[0,20]
	  user.name = auth.info.name
    end
  end
end
