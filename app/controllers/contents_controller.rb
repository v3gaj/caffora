class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :set_post
  # GET /contents
  # GET /contents.json
  def index
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)
    @content.post = @post
    respond_to do |format|
      if @content.save
        format.html { redirect_to @content.post, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
        format.js   { render :layout => false }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content.post, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:index, :style, :title, :body, :image, :video)
    end

    def authenticate_admin!
      unless current_user.present? && current_user.role === 'admin'
        redirect_to new_user_session_path
      end
    end
end
