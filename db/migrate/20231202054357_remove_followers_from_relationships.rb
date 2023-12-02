class RemoveFollowersFromRelationships < ActiveRecord::Migration[6.1]
  def change
    remove_column :relationships, :followers, :integer
  end
end
