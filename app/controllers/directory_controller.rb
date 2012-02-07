class DirectoryController < ApplicationController
    
  before_filter :authorize, :only => ['admin']
  before_filter :nav
  
  def homepage
    @attorneys = Attorney.find(:all)
    @firms_nav = Firm.find(:all)
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
  
  def catcher
    
    if params[:path].last == "attorneys.htm"
      redirect_to attorneys_url
    elsif params[:path].last == "recent_news.htm"
      redirect_to news_entries_url
    elsif params[:path].last == "contact.htm"
      redirect_to contact_url
    elsif params[:path].last == "jahartz.html" or params[:path].last == "jahartz.htm"
      @attorney = Attorney.find_by_short_name("judith_a_hartz")
      redirect_to attorney_url(@attorney)
    elsif params[:path].last == "bakozyra.html" or params[:path].last == "bakozyra.htm"
      @attorney = Attorney.find_by_short_name("barry_a_kozyra")
      redirect_to attorney_url(@attorney)
    elsif params[:path].last == "lapeduto.html" or params[:path].last == "lapeduto.htm"
      @attorney = Attorney.find_by_short_name("leonard_a_peduto_jr")
      redirect_to attorney_url(@attorney)
    elsif params[:path].last == "bwbresnick.html" or params[:path].last == "bwbresnick.htm"
      @attorney = Attorney.find_by_short_name("betsy_w_bresnick")
      redirect_to attorney_url(@attorney)
    elsif params[:path].last == "rgadhok.html" or params[:path].last == "rgadhok.htm"
      @attorney = Attorney.find_by_short_name("raj_gadhok")
      redirect_to attorney_url(@attorney)
    elsif params[:path].last == "reross.html" or params[:path].last == "reross.htm"
      redirect_to attorneys_url
    else
      render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
    end
    
  end
  
  
  def firm_overview
    render :layout => "general_layout"
  end
  
end

