class Post < ActiveRecord::Base
  validates_presence_of :user_id, :content

  belongs_to :user

  after_create :check_mentions

  def check_mentions
    user = User.basic_search(self.content).first
    if user
      UserMailer.mention(user).deliver
    end
  end
end
