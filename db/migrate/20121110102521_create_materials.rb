class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :material_type   # major assist 
      t.string :name
      t.string :amount
      t.integer :article_id

      t.timestamps
    end
  end
end
