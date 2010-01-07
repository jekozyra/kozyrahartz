class FirmsController < ApplicationController
  
  before_filter :nav, :only => ['index','show']
  before_filter :authorize, :except => ['index', 'show']
  
  # GET /firms
  # GET /firms.xml
  def index
    @firms = Firm.all
    @overview = Firm.find_by_url("overview")
    respond_to do |format|
      format.html { render :layout => "general_layout"} # index.html.erb
      format.xml  { render :xml => @firms }
    end
  end

  # GET /firms/1
  # GET /firms/1.xml
  def show
    @firm = Firm.find_by_url(params[:id])

    respond_to do |format|
      format.html { render :layout => "general_layout"} # show.html.erb
      format.xml  { render :xml => @firm }
    end
  end

  # GET /firms/new
  # GET /firms/new.xml
  def new
    @firm = Firm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @firm }
    end
  end

  # GET /firms/1/edit
  def edit
    @firm = Firm.find_by_url(params[:id])
  end

  # POST /firms
  # POST /firms.xml
  def create
    @firm = Firm.new(params[:firm])
    @firm.url = @firm.title.downcase.gsub(' ','_')

    respond_to do |format|
      if @firm.save
        flash[:notice] = 'Firm was successfully created.'
        format.html { redirect_to(@firm) }
        format.xml  { render :xml => @firm, :status => :created, :location => @firm }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @firm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /firms/1
  # PUT /firms/1.xml
  def update
    @firm = Firm.find_by_url(params[:id])
    unless params[:firm][:title].nil?
      @firm.url = params[:firm][:title].downcase.gsub(' ','_')
    end    
    respond_to do |format|
      if @firm.update_attributes(params[:firm])
        flash[:notice] = 'Firm was successfully updated.'
        format.html { redirect_to(@firm) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @firm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /firms/1
  # DELETE /firms/1.xml
  def destroy
    @firm = Firm.find_by_url(params[:id])
    @firm.destroy

    respond_to do |format|
      format.html { redirect_to(firms_url) }
      format.xml  { head :ok }
    end
  end
  
    # GET /attorneys
  # GET /attorneys.xml
  def firm_list
    @firms = Firm.all

  end
  
  
end
