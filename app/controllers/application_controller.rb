# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_uri] = request.request_uri
      flash[:notice] = "Please log in!"
      redirect_to :controller => 'admin/users', :action => 'login'
    end
  end
  
  def nav
    @attorneys_nav = Attorney.find(:all)
    @firms = Firm.find(:all)
    @practice_areas_nav = PracticeArea.find(:all)
    @news_entries_nav = NewsEntry.find(:all, :limit => 20, :order => "date DESC")
  end
  
  
  
end
