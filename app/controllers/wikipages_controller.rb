class WikipagesController < ApplicationController
  # GET /wikipages
  # GET /wikipages.json
  def index
    @wikipages = Wikipage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wikipages }
    end
  end

  # GET /wikipages/1
  # GET /wikipages/1.json
  def show
    @wikipage = Wikipage.find(params[:id])
    @history =  Activity.where(
      :action_object_id => @wikipage.id,
      :action_object_type => "Wikipage"
    ).order("updated_at DESC")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wikipage }
      format.js
    end
  end

  # GET /wikipages/new
  # GET /wikipages/new.json
  def new
    @wikipage = Wikipage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wikipage }
    end
  end

  # GET /wikipages/1/edit
  def edit
    @wikipage = Wikipage.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  # POST /wikipages
  # POST /wikipages.json
  def create
    @wikipage = Wikipage.new(params[:wikipage])
    @wikipage.user_id = current_user.id

    if @wikipage.save
      if params.has_key?(:group_id)
        @group = Group.find(params[:group_id])
        @group.follow(@wikipage)
      end
    end

    respond_to do |format|
      unless @wikipage.new_record?
        format.html { redirect_to :back, notice: 'Wikipage was successfully created.' }
        format.json { render json: @wikipage, status: :created, location: @wikipage }
      else
        format.html { render action: "new" }
        format.json { render json: @wikipage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wikipages/1
  # PUT /wikipages/1.json
  def update
    @wikipage = Wikipage.find(params[:id])


    respond_to do |format|
      if @wikipage.update_attributes(params[:wikipage])
        format.html { redirect_to @wikipage, notice: 'Wikipage was successfully updated.' }
        format.js {@update_activity = Activity.last}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @wikipage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wikipages/1
  # DELETE /wikipages/1.json
  def destroy
    @wikipage = Wikipage.find(params[:id])
    @wikipage.destroy

    respond_to do |format|
      format.html { redirect_to wikipages_url }
      format.json { head :ok }
    end
  end
end

