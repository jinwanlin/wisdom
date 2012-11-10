class ChangeStringToText < ActiveRecord::Migration
  def up
    change_column :"doctors", :desc, :text
    change_column :"doctors", :major, :text
    change_column :"community_health_stations", :desc, :text
    change_column :"community_health_stations", :openoffice, :text
    change_column :"hospitals", :desc, :text
    change_column :"hospitals", :openoffice, :text
    change_column :"merchants", :desc, :text
    change_column :"communities", :desc, :text
  end

  def down
    change_column :"doctors", :desc, :string
    change_column :"doctors", :major, :string
    change_column :"community_health_stations", :desc, :string
    change_column :"community_health_stations", :openoffice, :string
    change_column :"hospitals", :desc, :string
    change_column :"hospitals", :openoffice, :string
    change_column :"merchants", :desc, :string
    change_column :"communities", :desc, :string
  end
end