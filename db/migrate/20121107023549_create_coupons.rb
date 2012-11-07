class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :merchant_name
      t.string :merchant_contact
      t.string :merchant_address
      t.string :title
      t.text :desc
      t.string :expire
      t.string :category
      t.string :cover

      t.timestamps
    end
  end
end
