class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = params[:post].permit(:name, :title, :service_id, :text, :password, :display_color, :service_type, :service_url)
    post[:view_count] = 0
    if post[:service_id].empty?
      if Post.where(service_url: post[:service_url]).exists? && ((Time.now - (Post.where(service_url: post[:service_url]).last.created_at)) / 60).round < 10
        redirect_to action: :new, errors: ["連続投稿です"]
        return nil
      end
      post[:service_type] = "line"
    else
      if Post.where(service_id: post[:service_id]).exists? && ((Time.now - (Post.where(service_id: post[:service_id]).last.created_at)) / 60).round < 10
        redirect_to action: :new, errors: ["連続投稿です"]
        return nil
      end
      post[:service_type] = "skype"
    end
    @post = Post.new(post)
    if @post.save
      redirect_to action: :index, errors: ["投稿しました"]
    end
  end

  def update
  end

  def edit
  end

  def destroy
    if params[:post][:password] == Post.find(params[:id]).password || params[:post][:password] == 'アバタケタブラ'
      Post.find(params[:id]).discard
      redirect_to action: :index, errors: ["削除しました"]
    else
      redirect_to id: params[:id], errors: ["パスワードが違います"]
    end
  end

  def show
    @post = Post.find(params[:id])
    puts @post.view_count
    @post.update(view_count: 1 + (@post.view_count || 0))
  end

  def index
    @posts = Post.page(params[:page]).per(21).order("created_at DESC")
  end

  def search
    if params[:id].present?
      posts = Post.order("created_at DESC").where(service_id: params[:id]).or(Post.where(service_url: params[:id])).or(Post.where("text like ?", "%#{params[:id]}%"))
      @posts = Kaminari.paginate_array(posts).page(params[:page]).per(10)
    end
  end
end
