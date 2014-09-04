class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :follower_id
    end
  end
end
