class ChangeSubscriptionsTableName < ActiveRecord::Migration
  def change
    rename_table :subscriptions, :followings
  end
end
