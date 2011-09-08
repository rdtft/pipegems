class RubygemVersionsController < ApplicationController

  before_filter :find_rubygem

  # GET /rubygem_versions
  # GET /rubygem_versions.json
  def index
    @rubygem_versions = @rubygem.rubygem_versions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @rubygem_versions }
    end
  end

  # GET /rubygem_versions/1
  # GET /rubygem_versions/1.json
  def show
    @rubygem_version = RubygemVersion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @rubygem_version }
    end
  end

  # GET /rubygem_versions/new
  # GET /rubygem_versions/new.json
  def new
    @rubygem_version = RubygemVersion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @rubygem_version }
    end
  end

  # GET /rubygem_versions/1/edit
  def edit
    @rubygem_version = RubygemVersion.find(params[:id])
  end

  # POST /rubygem_versions
  # POST /rubygem_versions.json
  def create
    @rubygem_version = RubygemVersion.new( params[:rubygem_version].merge(:rubygem => @rubygem) )

    respond_to do |format|
      if @rubygem_version.save
        format.html { redirect_to edit_rubygem_version_path(@rubygem, @rubygem_version), :notice => 'Rubygem version was successfully created.' }
        format.json { render :json => @rubygem_version, :status => :created, :location => @rubygem_version }
      else
        format.html { render :action => "new" }
        format.json { render :json => @rubygem_version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rubygem_versions/1
  # PUT /rubygem_versions/1.json
  def update
    @rubygem_version = RubygemVersion.find(params[:id])

    respond_to do |format|
      if @rubygem_version.update_attributes(params[:rubygem_version])
        format.html { redirect_to @rubygem_version, :notice => 'Rubygem version was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @rubygem_version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rubygem_versions/1
  # DELETE /rubygem_versions/1.json
  def destroy
    @rubygem_version = RubygemVersion.find(params[:id])
    @rubygem_version.destroy

    respond_to do |format|
      format.html { redirect_to rubygem_versions_url }
      format.json { head :ok }
    end
  end

  protected

    def find_rubygem
      @rubygem = Rubygem.find( params[:rubygem_id] )
    end

end
