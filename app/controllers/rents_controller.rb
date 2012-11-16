class RentsController < ApplicationController
  # GET /rents
  # GET /rents.json
  def index
    @rents = Rent
    @rents = @rents.where(:community_id => params[:community_id]) if params[:community_id].present?
    @rents = @rents.where(:rent_type => params[:rent_type]) if params[:rent_type].present?
    @rents = @rents.where("price >= ?", params[:price_start]) if params[:price_start].present?
    @rents = @rents.where("price <= ?", params[:price_end]) if params[:price_end].present?
    order = case params[:order]
            when 'price_up' then 'price ASC'
            when 'price_down' then 'price DESC'
            when 'area_up' then 'area ASC'
            when 'area_down' then 'area DESC'
            else
              'created_at DESC'
            end
    @rents = @rents.order(order)

    @rents = @rents.paginate :page => params[:page], :per_page => params[:per_page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: to_json_with_pagination(@rents) }
    end
  end

  # GET /rents/1
  # GET /rents/1.json
  def show
    @rent = Rent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rent }
    end
  end

  # GET /rents/new
  # GET /rents/new.json
  def new
    @rent = Rent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rent }
    end
  end

  # GET /rents/1/edit
  def edit
    @rent = Rent.find(params[:id])
  end

  # POST /rents
  # POST /rents.json
  def create
    @rent = Rent.new(params[:rent])
    add_attachments(@rent)

    respond_to do |format|
      if @rent.save
        format.html { redirect_to @rent, notice: 'Rent was successfully created.' }
        format.json { render json: @rent, status: :created, location: @rent }
      else
        format.html { render action: "new" }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rents/1
  # PUT /rents/1.json
  def update
    @rent = Rent.find(params[:id])
    add_attachments(@rent)
    
    respond_to do |format|
      if @rent.update_attributes(params[:rent])
        format.html { redirect_to @rent, notice: 'Rent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rents/1
  # DELETE /rents/1.json
  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy

    respond_to do |format|
      format.html { redirect_to rents_url }
      format.json { head :no_content }
    end
  end
end
