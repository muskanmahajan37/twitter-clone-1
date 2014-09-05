class UsersController < ApplicationController

  def show
    @relationship = Relationship.new
    @user = User.find(params[:id])
  end
end
