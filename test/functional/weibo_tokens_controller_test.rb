require 'test_helper'

class WeiboTokensControllerTest < ActionController::TestCase
  setup do
    @weibo_token = weibo_tokens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weibo_tokens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weibo_token" do
    assert_difference('WeiboToken.count') do
      post :create, weibo_token: { account_id: @weibo_token.account_id, token: @weibo_token.token }
    end

    assert_redirected_to weibo_token_path(assigns(:weibo_token))
  end

  test "should show weibo_token" do
    get :show, id: @weibo_token
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weibo_token
    assert_response :success
  end

  test "should update weibo_token" do
    put :update, id: @weibo_token, weibo_token: { account_id: @weibo_token.account_id, token: @weibo_token.token }
    assert_redirected_to weibo_token_path(assigns(:weibo_token))
  end

  test "should destroy weibo_token" do
    assert_difference('WeiboToken.count', -1) do
      delete :destroy, id: @weibo_token
    end

    assert_redirected_to weibo_tokens_path
  end
end
