class CreateCommunityHealthStations < ActiveRecord::Migration
  def change
    create_table :community_health_stations do |t|
      t.string :name
      t.string :community_name
      t.string :location
      t.string :essence
      t.string :desc
      t.string :contact
      t.string :workingtime
      t.string :openoffice

      t.timestamps
    end
  end
end
