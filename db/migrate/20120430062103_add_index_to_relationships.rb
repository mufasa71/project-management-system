class AddIndexToRelationships < ActiveRecord::Migration
  def up
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], :unique => true
  end

  def down
    remove_index :relationships, :follower_id
    remove_index :relationships, :followed_id
    remove_index :relationships, [:follower_id, :followed_id]
  end
end
