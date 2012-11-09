class CommunityHealthStationsController < ApplicationController
  # GET /community_health_stations
  # GET /community_health_stations.json
  def index
    @community_health_stations = CommunityHealthStation.order("created_at DESC").paginate :page => params[:page], :per_page => params[:per_page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: to_json_with_pagination(@community_health_stations) }
    end
  end

  # GET /community_health_stations/1
  # GET /community_health_stations/1.json
  def show
    @community_health_station = CommunityHealthStation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @community_health_station }
    end
  end

  # GET /community_health_stations/new
  # GET /community_health_stations/new.json
  def new
    @community_health_station = CommunityHealthStation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @community_health_station }
    end
  end

  # GET /community_health_stations/1/edit
  def edit
    @community_health_station = CommunityHealthStation.find(params[:id])
  end

  # POST /community_health_stations
  # POST /community_health_stations.json
  def create
    @community_health_station = CommunityHealthStation.new(params[:community_health_station])

    if params[:attachments]
      params[:attachments].each do |attachment|
        @community_health_station.attachments << Attachment.new(:source => attachment) unless attachment.blank?
      end
    end

    respond_to do |format|
      if @community_health_station.save
        format.html { redirect_to @community_health_station, notice: 'Community health station was successfully created.' }
        format.json { render json: @community_health_station, status: :created, location: @community_health_station }
      else
        format.html { render action: "new" }
        format.json { render json: @community_health_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /community_health_stations/1
  # PUT /community_health_stations/1.json
  def update
    @community_health_station = CommunityHealthStation.find(params[:id])

    respond_to do |format|
      if @community_health_station.update_attributes(params[:community_health_station])
        format.html { redirect_to @community_health_station, notice: 'Community health station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @community_health_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_health_stations/1
  # DELETE /community_health_stations/1.json
  def destroy
    @community_health_station = CommunityHealthStation.find(params[:id])
    @community_health_station.destroy

    respond_to do |format|
      format.html { redirect_to community_health_stations_url }
      format.json { head :no_content }
    end
  end
end
