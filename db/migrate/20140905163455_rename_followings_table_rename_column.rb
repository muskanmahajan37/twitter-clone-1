class RenameFollowingsTableRenameColumn < ActiveRecord::Migration
  def change
    rename_table :followings, :subscriptions
  end
end
