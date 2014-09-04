class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome_message

  validates_presence_of :name

  has_many :posts
  has_many :followers, class_name: 'Followings', foreign_key: 'user_id'
  has_many :following, class_name: 'Followings', foreign_key: 'follower_id'
  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end
end
