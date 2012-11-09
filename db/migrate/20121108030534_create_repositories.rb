class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :base_type
      t.string :title
      t.text :content
      t.string :content_url
      t.string :category

      t.timestamps
    end
  end
end
