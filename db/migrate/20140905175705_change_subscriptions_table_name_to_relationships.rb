class ChangeSubscriptionsTableNameToRelationships < ActiveRecord::Migration
  def change
    rename_table :subscriptions, :relationships
  end
end
