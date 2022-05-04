class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = params[:post].permit(:name, :title, :service_id, :text, :password, :display_color, :service_type, :service_url)
    if post[:service_id].empty?
      post[:service_type] = "line"
    else
      post[:service_type] = "skype"
    end
    @post = Post.new(post)
    if @post.save
      redirect_to action: :index
    end
  end

  def update
  end

  def edit
  end

  def destroy
    if params[:post][:password] == Post.find(params[:id]).password
      Post.find(params[:id]).discard
      redirect_to action: :index, errors: ["削除しました"]
    else
      redirect_to  id: params[:id], errors: ["パスワードが違います"]
    end


  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.page(params[:page]).per(21).order("created_at DESC")
  end

  def search
    Rails.logger.debug(params[:id])
    Rails.logger.debug("params[:id]＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝")
    posts = Post.where(service_id: params[:id]).or(Post.where(service_url: params[:id]))
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(10)
  end
end
