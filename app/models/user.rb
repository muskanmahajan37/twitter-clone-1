class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome_message

  validates_presence_of :name

  has_many :posts

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end
end
