class NotesController < ApplicationController
  before_filter :authenticate_user!
  # skip_before_filter :verify_authenticity_token
  # before_filter :parse_json_params, :if => "params[:format] == 'json'"
  
  # GET /notes
  # GET /notes.json
  def index
    @notes = Note
    @notes = @notes.where(:parent_id => params[:parent_id]) if params[:parent_id].present?
    @notes = @notes.where(:community_id => params[:community_id]) if params[:community_id].present?
    @notes = @notes.where("updated_at < ?", Time.parse(params[:time_begin])) if params[:time_begin].present?
    @notes = @notes.where("updated_at > ?", Time.parse(params[:time_end])) if params[:time_end].present?
    @notes = @notes.order("updated_at DESC").paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: to_json_with_pagination(@notes) }
    end
  end
  
  def photos
    @photos = Attachment
    @photos = @photos.where("notes.community_id = ?", params[:community_id]).joins(:notes) if params[:community_id].present?
    @photos = @photos.where("updated_at > ?", Time.parse(params[:timestamp])) if params[:timestamp].present?
    @photos = @photos.order("updated_at ASC").paginate :page => params[:page], :per_page => params[:per_page]
    
    render json: to_json_with_pagination(@photos)
  end
  
  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { 
        # render :text => @note.as_json(:include => {:comments => {:only => [:id]} })
        render json: @note
      }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(params[:note])
    
    # user
    # params[:note][:user_id] = current_user.id if params[:note][:user_id].blank?
    
    #add attachment
    @note.attachments << Attachment.new(:source => params[:attachment]) unless params[:attachment].blank?
    
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { 
          render json: {:id => @note.id}, status: :created, location: @note 
        }
      else
        format.html { render action: "new" }
        format.json { render :text => "error", :status => 401 }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end
  
  private
  def parse_json_params
    params[:note] = []
    %w(content user_id community_id parent_id attachment).each do |p|
      # puts params[p] if params[p].present?
    end
  end
end
