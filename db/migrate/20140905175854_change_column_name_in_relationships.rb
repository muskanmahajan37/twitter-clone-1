class ChangeColumnNameInRelationships < ActiveRecord::Migration
  def change
    rename_column :relationships, :user_id, :followed_id
    rename_column :relationships, :subscriber_id, :follower_id
  end
end
