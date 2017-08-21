class IndexController < ApplicationController
  def home
  	@sliders = Slider.all.order(:index)
  	@posts = Post.all.where("release_date <= ?", Date.today).order(release_date: :desc).limit(9)
  	@collections = Collection.all.joins(:post).where("posts.release_date <= ?", Date.today).order("posts.release_date desc").limit(6)
  end

  def blog
  	@posts = Post.all.where("release_date <= ?", Date.today).order(release_date: :desc)
  end

  def gallery
  	@collections = Collection.all.joins(:post).where("posts.release_date <= ?", Date.today).order("posts.release_date desc")
  end

  def about
    @pictures = Picture.all
  end

  def contact
    @message = Message.new
  end
end
