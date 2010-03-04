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
  
  def catcher
    
    if params[:path].last == "attorneys.htm"
      redirect_to attorneys_url
    elsif params[:path].last == "recent_news.htm"
      redirect_to news_entries_url
    elsif params[:path].last == "contact.htm"
      redirect_to contact_url
    elsif params[:path].last == "jahartz.htm"
      @attorney = Attorney.find_by_short_name("judith_a_hartz")
      redirect_to attorney_url(@attorney)
    elsif params[:path].last == "bkozyra.htm"
      @attorney = Attorney.find_by_short_name("barry_a_kozyra")
      redirect_to attorney_url(@attorney)
    elsif params[:path].last == "lapeduto.htm"
      @attorney = Attorney.find_by_short_name("leonard_a_peduto_jr")
      redirect_to attorney_url(@attorney)
    elsif params[:path].last == "bwbresnick.htm"
      @attorney = Attorney.find_by_short_name("betsy_w_bresnick")
      redirect_to attorney_url(@attorney)
    elsif params[:path].last == "rgadhok.htm"
      @attorney = Attorney.find_by_short_name("raj_gadhok")
      redirect_to attorney_url(@attorney)
    else
      render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
    end
    
  end
  
end

=begin
<xml xmlns:o="urn:schemas-microsoft-com:office:office">
 <o:MainFile HRef="../index.htm"/>

 <o:File HRef="recent_news.htm"/>
 <o:File HRef="contact.htm"/>
 <o:File HRef="attorneys.htm"/>
 <o:File HRef="disclaimer.htm"/>
 <o:File HRef="bakozyra.htm"/>
 <o:File HRef="jahartz.htm"/>
 <o:File HRef="rgadhok.htm"/>
 <o:File HRef="lapeduto.htm"/>
 <o:File HRef="bwbresnick.htm"/>
 <o:File HRef="reross.htm"/>
</xml>
=end

