class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.string :location
      t.string :desc
      t.string :score

      t.timestamps
    end
  end
end
