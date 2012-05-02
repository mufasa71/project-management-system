class RenameFriendshipsToRelationships < ActiveRecord::Migration
  def up
    rename_column :friendships, :user_id, :follower_id
    rename_column :friendships, :friend_id, :followed_id
    remove_column :friendships, :status
    rename_table :friendships, :relationships
  end

  def down
    rename_column :relationships, :follower_id, :user_id
    rename_column :relationships, :followed_id, :friend_id
    add_column :relationships, :status, :integer
    rename_table :relationships, :friendships
  end
end
