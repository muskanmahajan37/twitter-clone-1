class ChangeSubscriptionsTableNameAgain < ActiveRecord::Migration
  def change
    rename_table :subscriptions, :followings
  end
end
