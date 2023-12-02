class RemoveFollowsFromRelationships < ActiveRecord::Migration[6.1]
  def change
    remove_column :relationships, :follows, :integer
  end
end
