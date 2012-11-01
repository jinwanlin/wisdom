class UsersController < ApplicationController
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
  
  
end
