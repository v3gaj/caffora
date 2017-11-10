class IndexController < ApplicationController

  before_action :authenticate_user!, only: [:maintenance]
  before_action :authenticate_admin!, only: [:maintenance]

  def home
  	@sliders = Slider.all.order(:index)
  	@posts = Post.all.where("release_date <= ?", Date.today).order(release_date: :desc).limit(9)
  	#@collections = Collection.all.joins(:post).where("posts.release_date <= ?", Date.today).order("posts.release_date desc").limit(6)
    @collections = Collection.all.find_by_sql ["SELECT * FROM collections WHERE (select posts.release_date FROM posts where posts.id = collections.post_id) <= curdate() or post_id IS NULL ORDER BY IFNULL((SELECT release_date from posts WHERE posts.id = collections.post_id), created_at) DESC LIMIT 6;"]
    
    ajax_call
  end

  def blog
  	@posts = Post.all.where("release_date <= ?", Date.today).order(release_date: :desc)

    ajax_call
  end

  def gallery
  	#@collections = Collection.all.joins(:post).where("posts.release_date <= ?", Date.today).order("posts.release_date desc")
    @collections = Collection.all.find_by_sql ["SELECT * FROM collections WHERE (select posts.release_date FROM posts where posts.id = collections.post_id) <= curdate() or post_id IS NULL ORDER BY IFNULL((SELECT release_date from posts WHERE posts.id = collections.post_id), created_at) DESC;"]

    ajax_call
  end

  def about
    @pictures = Picture.all

    ajax_call
  end

  def contact
    @message = Message.new

    ajax_call
  end

  def winners
    ajax_call
  end

  def maintenance
    ajax_call
  end

  private
    def ajax_call
      if request.xhr? # checks whether its an ajax call
        render :layout => false
      else
        respond_to do |format|
          format.html {  }
        end
      end
    end

    def authenticate_admin!
      unless current_user.present? && current_user.role === 'admin'
        redirect_to new_user_session_path
      end
    end

end
