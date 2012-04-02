class RevisionsController < ApplicationController
  # GET /revisions
  # GET /revisions.json

  def index
    @revisions = Revision.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @revisions }
    end
  end

  # GET /revisions/1
  # GET /revisions/1.json
  def show
 #   @wikipage = WikiPage.find(params[:wikipage_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @revision }
    end
  end

  # GET /revisions/new
  # GET /revisions/new.json

  def new
    @revision = Revision.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @revision }
    end
  end

  # GET /revisions/1/edit
  def edit
    @revision = Revision.find(params[:id])
  end

  # POST /revisions
  # POST /revisions.json
  def create
    @revision = Revision.new(params[:revision])

    respond_to do |format|
      if @revision.save
        format.html { redirect_to @revision, notice: 'Revision was successfully created.' }
        format.json { render json: @revision, status: :created, location: @revision }
      else
        format.html { render action: "new" }
        format.json { render json: @revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /revisions/1
  # PUT /revisions/1.json
  def update
    @revision = Revision.find(params[:id])

    respond_to do |format|
      if @revision.update_attributes(params[:revision])
        format.html { redirect_to @revision, notice: 'Revision was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /revisions/1
  # DELETE /revisions/1.json
  def destroy
    @revision = Revision.find(params[:id])
    @revision.destroy

    respond_to do |format|
      format.html { redirect_to revisions_url }
      format.json { head :ok }
    end
  end
end
