class AddChildrenCountToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :children_count, :integer, :default => 0
  end
end
