class UserMailer < ActionMailer::Base
  default from: "get@twisted.com"

  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Sign Up Confirmation"
  end

  def mention(user)
    @user = user
    mail to: user.email, subject: "You were Twisted bro"
  end
end
