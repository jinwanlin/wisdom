class ApplicationController < ActionController::Base
  # before_filter :authenticate_user!
  protect_from_forgery
  
  protected
  def to_json_with_pagination(results)
    {:list => results, :page => results.current_page, :per_page => results.per_page, :total => results.total_entries}
  end
end
