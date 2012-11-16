require 'test_helper'

class RentsControllerTest < ActionController::TestCase
  setup do
    @rent = rents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rent" do
    assert_difference('Rent.count') do
      post :create, rent: { area: @rent.area, build_time: @rent.build_time, community_id: @rent.community_id, contact: @rent.contact, contact_people: @rent.contact_people, decoration: @rent.decoration, desc: @rent.desc, fitment: @rent.fitment, floor: @rent.floor, live_time: @rent.live_time, live_type: @rent.live_type, location: @rent.location, near: @rent.near, orientation: @rent.orientation, price: @rent.price, rent_type: @rent.rent_type, shape: @rent.shape, show_time: @rent.show_time, title: @rent.title, traffic: @rent.traffic }
    end

    assert_redirected_to rent_path(assigns(:rent))
  end

  test "should show rent" do
    get :show, id: @rent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rent
    assert_response :success
  end

  test "should update rent" do
    put :update, id: @rent, rent: { area: @rent.area, build_time: @rent.build_time, community_id: @rent.community_id, contact: @rent.contact, contact_people: @rent.contact_people, decoration: @rent.decoration, desc: @rent.desc, fitment: @rent.fitment, floor: @rent.floor, live_time: @rent.live_time, live_type: @rent.live_type, location: @rent.location, near: @rent.near, orientation: @rent.orientation, price: @rent.price, rent_type: @rent.rent_type, shape: @rent.shape, show_time: @rent.show_time, title: @rent.title, traffic: @rent.traffic }
    assert_redirected_to rent_path(assigns(:rent))
  end

  test "should destroy rent" do
    assert_difference('Rent.count', -1) do
      delete :destroy, id: @rent
    end

    assert_redirected_to rents_path
  end
end
