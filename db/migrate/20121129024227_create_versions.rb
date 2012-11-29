class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.float :version
      t.string :url
      t.text :desc

      t.timestamps
    end
  end
end
