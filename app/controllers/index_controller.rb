class IndexController < ApplicationController
  def home
  	@sliders = Slider.all.order(:index)
  	@posts = Post.all.where("release_date <= ?", Date.today).order(release_date: :desc).limit(9)
  	@collections = Collection.all.joins(:post).where("posts.release_date <= ?", Date.today).order("posts.release_date desc").limit(6)
  end

  def blog
  	@posts = Post.all.where("release_date <= ?", Date.today).order(release_date: :desc)

    if request.xhr? # checks whether its an ajax call
      render :layout => false
    else
      respond_to do |format|
        format.html {  }
      end
    end
  end

  def gallery
  	@collections = Collection.all.joins(:post).where("posts.release_date <= ?", Date.today).order("posts.release_date desc")

    if request.xhr? # checks whether its an ajax call
      render :layout => false
    else
      respond_to do |format|
        format.html {  }
      end
    end
  end

  def about
    @pictures = Picture.all

    if request.xhr? # checks whether its an ajax call
      render :layout => false
    else
      respond_to do |format|
        format.html {  }
      end
    end
  end

  def contact
    @message = Message.new

    if request.xhr? # checks whether its an ajax call
      render :layout => false
    else
      respond_to do |format|
        format.html {  }
      end
    end
  end

  def winners
    if request.xhr? # checks whether its an ajax call
      render :layout => false
    else
      respond_to do |format|
        format.html {  }
      end
    end
  end
end
