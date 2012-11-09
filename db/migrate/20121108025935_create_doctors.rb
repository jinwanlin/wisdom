class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :level
      t.string :sex
      t.string :age
      t.string :hostpital
      t.string :office
      t.string :major
      t.string :desc
      t.string :out_call

      t.timestamps
    end
  end
end
