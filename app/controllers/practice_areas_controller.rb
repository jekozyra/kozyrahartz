class PracticeAreasController < ApplicationController
  
  before_filter :nav, :only => ['index','show']
  
  # GET /practice_areas
  # GET /practice_areas.xml
  def index
    @practice_areas = PracticeArea.all

    respond_to do |format|
      format.html { render :layout => "general_layout"} # index.html.erb
      format.xml  { render :xml => @practice_areas }
    end
  end

  # GET /practice_areas/1
  # GET /practice_areas/1.xml
  def show
    @practice_area = PracticeArea.find_by_url(params[:id])

    respond_to do |format|
      format.html { render :layout => "general_layout"} # show.html.erb
      format.xml  { render :xml => @practice_area }
    end
  end

  # GET /practice_areas/new
  # GET /practice_areas/new.xml
  def new
    @practice_area = PracticeArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @practice_area }
    end
  end

  # GET /practice_areas/1/edit
  def edit
    @practice_area = PracticeArea.find_by_url(params[:id])
  end

  # POST /practice_areas
  # POST /practice_areas.xml
  def create
    @practice_area = PracticeArea.new(params[:practice_area])
    @practice_area.url = @practice_area.name.downcase.gsub(' ','_')

    respond_to do |format|
      if @practice_area.save
        flash[:notice] = 'PracticeArea was successfully created.'
        format.html { redirect_to(@practice_area) }
        format.xml  { render :xml => @practice_area, :status => :created, :location => @practice_area }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @practice_area.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /practice_areas/1
  # PUT /practice_areas/1.xml
  def update
    @practice_area = PracticeArea.find_by_url(params[:id])
    unless params[:practice_area][:name].nil?
      @practice_area.url = params[:practice_area][:name].downcase.gsub(' ','_')
    end

    respond_to do |format|
      if @practice_area.update_attributes(params[:practice_area])
        flash[:notice] = 'PracticeArea was successfully updated.'
        format.html { redirect_to(@practice_area) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @practice_area.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /practice_areas/1
  # DELETE /practice_areas/1.xml
  def destroy
    @practice_area = PracticeArea.find_by_url(params[:id])
    @practice_area.destroy

    respond_to do |format|
      format.html { redirect_to(practice_areas_url) }
      format.xml  { head :ok }
    end
  end
end
