class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :desc
      t.integer :position
      t.integer :article_id

      t.timestamps
    end
  end
end
