class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome_message

  validates_presence_of :name

  has_many :posts
  has_many :subscribers, class_name: 'Subscription', foreign_key: 'user_id'
  has_many :subscriptions, class_name: 'Subscription', foreign_key: 'subscriber_id'
  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end
end
