class DirectoryController < ApplicationController
  
  layout 'main_layout'
  
  before_filter :authorize, :only => ['admin']
  
  def homepage
    @attorneys = Attorney.find(:all)
    render :layout => "homepage_layout"
  end
  
  def thefirm
  end
  
  def contact
  end
  
  def admin
    render :layout => "admin_layout"
  end
  
end
