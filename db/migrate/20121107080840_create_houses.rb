class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :title
      t.string :contact
      t.string :location
      t.string :service_type
      t.string :v_type
      t.string :cover
      t.text :desc

      t.timestamps
    end
  end
end
