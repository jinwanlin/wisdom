class WeiboTokensController < ApplicationController
  # GET /weibo_tokens
  # GET /weibo_tokens.json
  def index
    @weibo_tokens = WeiboToken.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weibo_tokens }
    end
  end

  # GET /weibo_tokens/1
  # GET /weibo_tokens/1.json
  def show
    if params[:account_id].present?
      @weibo_token = WeiboToken.find_by_account_id(params[:account_id])
    elsif params[:id].present?
      @weibo_token = WeiboToken.find(params[:id])
    else
      @weibo_token = WeiboToken.first
    end
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: {:token => @weibo_token.token} }
    end
  end

  # GET /weibo_tokens/new
  # GET /weibo_tokens/new.json
  def new
    @weibo_token = WeiboToken.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weibo_token }
    end
  end

  # GET /weibo_tokens/1/edit
  def edit
    @weibo_token = WeiboToken.find(params[:id])
  end

  # POST /weibo_tokens
  # POST /weibo_tokens.json
  def create
    @weibo_token = WeiboToken.new(params[:weibo_token])

    respond_to do |format|
      if @weibo_token.save
        format.html { redirect_to @weibo_token, notice: 'Weibo token was successfully created.' }
        format.json { render json: @weibo_token, status: :created, location: @weibo_token }
      else
        format.html { render action: "new" }
        format.json { render json: @weibo_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weibo_tokens/1
  # PUT /weibo_tokens/1.json
  def update
    @weibo_token = WeiboToken.find(params[:id])

    respond_to do |format|
      if @weibo_token.update_attributes(params[:weibo_token])
        format.html { redirect_to @weibo_token, notice: 'Weibo token was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weibo_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weibo_tokens/1
  # DELETE /weibo_tokens/1.json
  def destroy
    @weibo_token = WeiboToken.find(params[:id])
    @weibo_token.destroy

    respond_to do |format|
      format.html { redirect_to weibo_tokens_url }
      format.json { head :no_content }
    end
  end
end
