class RemoveCoverToNews < ActiveRecord::Migration
  def up
    drop_attached_file :news, :cover
  end

  def down
    change_table :news do |t|
      t.has_attached_file :cover
    end
  end
end
