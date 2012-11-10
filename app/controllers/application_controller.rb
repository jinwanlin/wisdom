class ApplicationController < ActionController::Base
  # before_filter :authenticate_user!
  before_filter :prepare_for_mobile
  
  protect_from_forgery
  
  protected
  def to_json_with_pagination(results)
    {:list => results, :page => results.current_page, :per_page => results.per_page, :total => results.total_entries}
  end
  
  def add_attachments(object)
    if params[:attachments]
      params[:attachments].each do |attachment|
        object.attachments << Attachment.new(:source => attachment) unless attachment.blank?
      end
    end
  
  end
    
  
  private

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end
  

  
end
