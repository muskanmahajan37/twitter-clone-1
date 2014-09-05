class Relationship < ActiveRecord::Base

  validates_presence_of :follower_id
  validates_presence_of :followed_id

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  after_create :send_spotted_message

  def send_spotted_message
    @user = User.find(self.followed_id)
    UserMailer.spotted(@user).deliver
  end
end
