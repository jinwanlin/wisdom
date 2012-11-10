class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :address
      t.string :contact
      t.string :workingtime
      t.integer :author_id
      t.integer :forum_id

      t.timestamps
    end
  end
end
