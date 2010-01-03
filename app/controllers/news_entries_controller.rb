class NewsEntriesController < ApplicationController
  
  layout 'admin_layout'
  
  before_filter :authorize, :except => ['index', 'show']
  
  # GET /news_entries
  # GET /news_entries.xml
  def index
    @news_entries = NewsEntry.all

    respond_to do |format|
      format.html { render :layout => 'main_layout' } # index.html.erb
      format.xml  { render :xml => @news_entries }
    end
  end

  # GET /news_entries/1
  # GET /news_entries/1.xml
  def show
    @news_entry = NewsEntry.find(params[:id])

    respond_to do |format|
      format.html { render :layout => 'main_layout' } # show.html.erb
      format.xml  { render :xml => @news_entry }
    end
  end

  # GET /news_entries/new
  # GET /news_entries/new.xml
  def new
    @news_entry = NewsEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_entry }
    end
  end

  # GET /news_entries/1/edit
  def edit
    @news_entry = NewsEntry.find(params[:id])
  end

  # POST /news_entries
  # POST /news_entries.xml
  def create
    @news_entry = NewsEntry.new(params[:news_entry])

    respond_to do |format|
      if @news_entry.save
        flash[:notice] = 'NewsEntry was successfully created.'
        format.html { redirect_to(@news_entry) }
        format.xml  { render :xml => @news_entry, :status => :created, :location => @news_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news_entries/1
  # PUT /news_entries/1.xml
  def update
    @news_entry = NewsEntry.find(params[:id])

    respond_to do |format|
      if @news_entry.update_attributes(params[:news_entry])
        flash[:notice] = 'NewsEntry was successfully updated.'
        format.html { redirect_to(@news_entry) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news_entries/1
  # DELETE /news_entries/1.xml
  def destroy
    @news_entry = NewsEntry.find(params[:id])
    @news_entry.destroy

    respond_to do |format|
      format.html { redirect_to(news_list_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def news_list
    @news_entries = NewsEntry.all
  end
  
end
