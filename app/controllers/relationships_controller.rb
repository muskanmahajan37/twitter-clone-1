class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:followed_id])
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    end
  end

private

  def relationship_params
    params.require(:relationship).permit(:followed_id).merge(follower_id: current_user.id)
  end

end
