require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe "signup_confirmation" do

    before(:each) do
      ActionMailer::Base.deliveries.clear
      @user = FactoryGirl.create(:user)
    end

    let(:mail) { UserMailer.signup_confirmation(@user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Sign Up Confirmation")
      expect(mail.to).to eq([@user.email])
      expect(mail.from).to eq(["get@twisted.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to_not be_empty
    end
  end

  describe "mention" do
    before(:each) do
      ActionMailer::Base.deliveries.clear
      @user = FactoryGirl.create(:user)
      @other_user = FactoryGirl.create(:user)
    end

    let(:mail) { UserMailer.mention(@user) }

    it "renders the headers" do
      expect(mail.subject).to eq("You were Twisted bro")
      expect(mail.to).to eq([@user.email])
      expect(mail.from).to eq(["get@twisted.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to_not be_empty
    end
  end
end
