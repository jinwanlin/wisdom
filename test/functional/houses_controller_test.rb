require 'test_helper'

class HousesControllerTest < ActionController::TestCase
  setup do
    @house = houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create house" do
    assert_difference('House.count') do
      post :create, house: { contact: @house.contact, cover: @house.cover, desc: @house.desc, location: @house.location, name: @house.name, service_type: @house.service_type, title: @house.title, v_type: @house.v_type }
    end

    assert_redirected_to house_path(assigns(:house))
  end

  test "should show house" do
    get :show, id: @house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @house
    assert_response :success
  end

  test "should update house" do
    put :update, id: @house, house: { contact: @house.contact, cover: @house.cover, desc: @house.desc, location: @house.location, name: @house.name, service_type: @house.service_type, title: @house.title, v_type: @house.v_type }
    assert_redirected_to house_path(assigns(:house))
  end

  test "should destroy house" do
    assert_difference('House.count', -1) do
      delete :destroy, id: @house
    end

    assert_redirected_to houses_path
  end
end
