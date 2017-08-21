class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :set_collection
  # GET /images
  # GET /images.json
  def index
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @image.collection = @collection
    respond_to do |format|
      if @image.save
        format.html { redirect_to @collection, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to @collection, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    def set_collection
      @collection = Collection.find(params[:collection_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:collection_id, :content)
    end

    def authenticate_admin!
      unless current_user.present? && current_user.role === 'admin'
        redirect_to new_user_session_path
      end
    end
end
