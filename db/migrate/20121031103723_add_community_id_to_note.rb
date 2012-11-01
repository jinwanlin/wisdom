class AddCommunityIdToNote < ActiveRecord::Migration
  def change
    add_column :notes, :community_id, :string
  end
end
