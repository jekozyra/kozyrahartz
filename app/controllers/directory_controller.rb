class DirectoryController < ApplicationController
    
  before_filter :authorize, :only => ['admin']
  before_filter :nav
  
  def homepage
    @attorneys = Attorney.find(:all)
    @firms = Firm.find(:all)
    @practice_areas = PracticeArea.find(:all)
    render :layout => "homepage_layout"
  end

  def contact
    render :layout => "general_layout"
  end
  
  def admin
    render :layout => "admin_layout"
  end
  
  def credits
    render :layout => "general_layout"
  end
  
end
