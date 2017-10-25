class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :authenticate_admin!, except: [:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(release_date: :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.contents = @post.contents.all.order(:index)
    @collection = Collection.find_by_post_id(@post.id)

    @post.contents.each do |content|
      if content.style === "Paragraph"
          @page_description = content.body
        break
      end
    end

    if request.xhr? # checks whether its an ajax call
      render :layout => false
    else
      respond_to do |format|
        format.html {  }
      end
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @posts = Post.all.order(release_date: :desc)
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        format.js   { render :layout => false }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @posts = Post.all.order(release_date: :desc)
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
        format.js   { render :layout => false }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :subtitle, :release_date, :cover, :author)
    end

    def authenticate_admin!
      unless current_user.present? && current_user.role === 'admin'
        redirect_to new_user_session_path
      end
    end
end
