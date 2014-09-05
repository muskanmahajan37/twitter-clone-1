class ChangeSubColumnName < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :follower_id, :subscriber_id
  end
end
