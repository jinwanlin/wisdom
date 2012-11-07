class SecondsController < ApplicationController
  # GET /seconds
  # GET /seconds.json
  def index
    @seconds = Second.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seconds }
    end
  end

  # GET /seconds/1
  # GET /seconds/1.json
  def show
    @second = Second.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @second }
    end
  end

  # GET /seconds/new
  # GET /seconds/new.json
  def new
    @second = Second.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @second }
    end
  end

  # GET /seconds/1/edit
  def edit
    @second = Second.find(params[:id])
  end

  # POST /seconds
  # POST /seconds.json
  def create
    @second = Second.new(params[:second])

    #add attachment
    @second.attachments << Attachment.new(:source => params[:attachment]) unless params[:attachment].blank?

    respond_to do |format|
      if @second.save
        format.html { redirect_to @second, notice: 'Second was successfully created.' }
        format.json { render json: @second, status: :created, location: @second }
      else
        format.html { render action: "new" }
        format.json { render json: @second.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seconds/1
  # PUT /seconds/1.json
  def update
    @second = Second.find(params[:id])

    respond_to do |format|
      if @second.update_attributes(params[:second])
        format.html { redirect_to @second, notice: 'Second was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @second.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seconds/1
  # DELETE /seconds/1.json
  def destroy
    @second = Second.find(params[:id])
    @second.destroy

    respond_to do |format|
      format.html { redirect_to seconds_url }
      format.json { head :no_content }
    end
  end
end
