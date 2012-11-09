require 'test_helper'

class HospitalsControllerTest < ActionController::TestCase
  setup do
    @hospital = hospitals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hospitals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hospital" do
    assert_difference('Hospital.count') do
      post :create, hospital: { contact: @hospital.contact, desc: @hospital.desc, essence: @hospital.essence, level: @hospital.level, location: @hospital.location, name: @hospital.name, openoffice: @hospital.openoffice, workingtime: @hospital.workingtime }
    end

    assert_redirected_to hospital_path(assigns(:hospital))
  end

  test "should show hospital" do
    get :show, id: @hospital
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hospital
    assert_response :success
  end

  test "should update hospital" do
    put :update, id: @hospital, hospital: { contact: @hospital.contact, desc: @hospital.desc, essence: @hospital.essence, level: @hospital.level, location: @hospital.location, name: @hospital.name, openoffice: @hospital.openoffice, workingtime: @hospital.workingtime }
    assert_redirected_to hospital_path(assigns(:hospital))
  end

  test "should destroy hospital" do
    assert_difference('Hospital.count', -1) do
      delete :destroy, id: @hospital
    end

    assert_redirected_to hospitals_path
  end
end
