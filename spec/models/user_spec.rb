require 'rails_helper'

RSpec.describe User, :type => :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  subject { @user }

  it { should validate_presence_of :name }
  it { should have_many :posts }
  it { should have_many :followers }
  it { should have_many :followed_users }

  describe "following" do
    before(:each) do
      @other_user = FactoryGirl.create(:user)
      @user.follow(@other_user)
    end

    it { should be_following @other_user }
    # its(:followed_users) { should include(other_user) }
  end
end
