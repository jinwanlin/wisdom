require 'test_helper'

class SecondsControllerTest < ActionController::TestCase
  setup do
    @second = seconds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seconds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create second" do
    assert_difference('Second.count') do
      post :create, second: { desc: @second.desc, owner: @second.owner, price: @second.price, rate: @second.rate, title: @second.title, views: @second.views }
    end

    assert_redirected_to second_path(assigns(:second))
  end

  test "should show second" do
    get :show, id: @second
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @second
    assert_response :success
  end

  test "should update second" do
    put :update, id: @second, second: { desc: @second.desc, owner: @second.owner, price: @second.price, rate: @second.rate, title: @second.title, views: @second.views }
    assert_redirected_to second_path(assigns(:second))
  end

  test "should destroy second" do
    assert_difference('Second.count', -1) do
      delete :destroy, id: @second
    end

    assert_redirected_to seconds_path
  end
end
