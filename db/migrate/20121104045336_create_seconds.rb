class CreateSeconds < ActiveRecord::Migration
  def change
    create_table :seconds do |t|
      t.string :title
      t.string :owner
      t.float :price
      t.integer :views
      t.string :rate
      t.string :contact
      t.text :desc

      t.timestamps
    end
  end
end
