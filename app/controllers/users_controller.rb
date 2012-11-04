class UsersController < ApplicationController
#  before_filter :authenticate_user!
  # skip_before_filter :verify_authenticity_token
  
  def index
    @users = User
    @users = @users.where(:community_id => params[:community_id]) if params[:community_id].present?
    @users = @users.where("updated_at > ?", Time.parse(params[:timestamp])) if params[:timestamp].present?
    @users = @users.order("updated_at ASC")
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      render json: @user
    else
      render :status => 401
    end
    
  end
  
  def login
    account_type = params[:account_type]
    account_id = params[:account_id]
    avatar = params[:avatar]
    name = params[:name]
    
    if account_type == "sina"
      @user = User.find_by_sina_id(account_id) if account_id.present?
      @user ||= User.create!(:sina_id => account_id, :email=> account_id + "@example.com", :password => "111111", 
                            :name => name, :avatar => avatar)
    end
    respond_to do |format|
      format.json {
        unless @user.nil?
          render json: @user
        else
          render :text => "error".to_json, :status => 401
        end
      }
    end
    
  end
  
end
