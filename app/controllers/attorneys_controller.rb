class AttorneysController < ApplicationController
  
  layout 'admin_layout'
  
  before_filter :authorize, :except => ['index', 'show']
  
  # GET /attorneys
  # GET /attorneys.xml
  def index
    @attorneys = Attorney.all

    respond_to do |format|
      format.html {render :layout => 'main_layout' }# index.html.erb
      format.xml  { render :xml => @attorneys }
    end
  end


  # GET /attorneys
  # GET /attorneys.xml
  def attorneys_list
    @attorneys = Attorney.all

  end


  # GET /attorneys/1
  # GET /attorneys/1.xml
  def show
    @attorney = Attorney.find_by_short_name(params[:id])

    respond_to do |format|
      format.html { render :layout => 'main_layout' } # show.html.erb
      format.xml  { render :xml => @attorney }
    end
  end

  # GET /attorneys/new
  # GET /attorneys/new.xml
  def new
    @attorney = Attorney.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attorney }
    end
  end

  # GET /attorneys/1/edit
  def edit
    
    @attorney = Attorney.find_by_short_name(params[:id])

  end

  # POST /attorneys
  # POST /attorneys.xml
  def create
    @attorney = Attorney.new(params[:attorney])
    @attorney.short_name = @attorney.name.gsub(' ', '').downcase

    respond_to do |format|
      if @attorney.save
          flash[:notice] = 'Attorney was successfully created.'
          format.html { redirect_to(attorneys_list_url) }
          format.xml  { render :xml => @attorney, :status => :created, :location => @attorney }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attorney.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attorneys/1
  # PUT /attorneys/1.xml
  def update
    @attorney = Attorney.find_by_short_name(params[:id])
    @attorney.short_name = @attorney.name.gsub(' ', '').downcase

    respond_to do |format|
      if @attorney.update_attributes(params[:attorney])
          flash[:notice] = 'Attorney was successfully updated.'
          format.html { redirect_to(attorneys_list_url) }
          format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attorney.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attorneys/1
  # DELETE /attorneys/1.xml
  def destroy
    @attorney = Attorney.find_by_short_name(params[:id])
    @attorney.destroy

    respond_to do |format|
      format.html { redirect_to(attorneys_list_url) }
      format.xml  { head :ok }
    end
  end
end
