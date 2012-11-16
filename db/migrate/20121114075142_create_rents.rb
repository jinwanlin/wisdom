class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.string :title
      t.string :rent_type
      t.string :people_type
      t.integer :price
      t.string :live_type
      t.integer :community_id
      t.integer :area
      t.string :shape
      t.string :floor
      t.string :decoration
      t.string :fitment
      t.string :orientation
      t.string :show_time
      t.string :live_time
      t.string :build_time
      t.string :location
      t.text :desc
      t.string :contact_people
      t.string :contact
      t.text :near
      t.text :traffic

      t.timestamps
    end
  end
end
