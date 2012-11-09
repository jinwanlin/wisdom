class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :location
      t.string :essence
      t.string :desc
      t.string :contact
      t.string :workingtime
      t.string :openoffice
      t.string :level

      t.timestamps
    end
  end
end
