class DirectoryController < ApplicationController
  
  layout 'main_layout'
  
  before_filter :authorize, :only => ['admin']
  
  def homepage
    @attorneys = Attorney.find(:all)
    @firms = Firm.find(:all)
    @practice_areas = PracticeArea.find(:all)
    render :layout => "homepage_layout"
  end
  
  def thefirm
  end
  
  def contact
  end
  
  def admin
    render :layout => "admin_layout"
  end
  
  def credits
  end
  
end
