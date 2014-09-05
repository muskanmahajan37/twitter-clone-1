require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of :name }
  it { should have_many :posts }
  it { should have_many :subscribers }
  it { should have_many :subscriptions }

  describe ".subscribe" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @other_user = FactoryGirl.create(:user)
      @user.subscribe(@other_user)
    end

    it "lets a user subscribe to another user" do
      expect(@user.subscriptions).to eq [@other_user]
    end
  end

end
