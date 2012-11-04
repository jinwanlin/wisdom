class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :app_type
      t.string :service_type
      t.string :name
      t.string :title
      t.string :business_hours
      t.string :contact
      t.integer :position
      t.string :location
      t.string :desc
      t.string :v_type

      t.timestamps
    end
  end
end
