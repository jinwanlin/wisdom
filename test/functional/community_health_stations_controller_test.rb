require 'test_helper'

class CommunityHealthStationsControllerTest < ActionController::TestCase
  setup do
    @community_health_station = community_health_stations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:community_health_stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create community_health_station" do
    assert_difference('CommunityHealthStation.count') do
      post :create, community_health_station: { community_name: @community_health_station.community_name, contact: @community_health_station.contact, desc: @community_health_station.desc, essence: @community_health_station.essence, location: @community_health_station.location, name: @community_health_station.name, openoffice: @community_health_station.openoffice, workingtime: @community_health_station.workingtime }
    end

    assert_redirected_to community_health_station_path(assigns(:community_health_station))
  end

  test "should show community_health_station" do
    get :show, id: @community_health_station
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @community_health_station
    assert_response :success
  end

  test "should update community_health_station" do
    put :update, id: @community_health_station, community_health_station: { community_name: @community_health_station.community_name, contact: @community_health_station.contact, desc: @community_health_station.desc, essence: @community_health_station.essence, location: @community_health_station.location, name: @community_health_station.name, openoffice: @community_health_station.openoffice, workingtime: @community_health_station.workingtime }
    assert_redirected_to community_health_station_path(assigns(:community_health_station))
  end

  test "should destroy community_health_station" do
    assert_difference('CommunityHealthStation.count', -1) do
      delete :destroy, id: @community_health_station
    end

    assert_redirected_to community_health_stations_path
  end
end
