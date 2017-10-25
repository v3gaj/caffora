class CollectionsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :authenticate_admin!, except: [:show]
  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all.joins(:post).order("posts.release_date desc")
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    @collection.images = @collection.images.all

    if request.xhr? # checks whether its an ajax call
      render :layout => false
    else
      respond_to do |format|
        format.html {  }
      end
    end
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  # POST /collections.json
  def create
    @collections = Collection.all.joins(:post).order("posts.release_date desc")
    @collection = Collection.new(collection_params)
    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @collection }
        format.js   { render :layout => false }
      else
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    @collections = Collection.all.joins(:post).order("posts.release_date desc")
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params.require(:collection).permit(:post_id, :title, :subtitle, :cover)
    end

    def authenticate_admin!
      unless current_user.present? && current_user.role === 'admin'
        redirect_to new_user_session_path
      end
    end
end
