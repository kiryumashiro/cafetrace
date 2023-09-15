class Customer::BlogsController < ApplicationController
    # 新規ブログの投稿
  def new
    @blog = Blog.new
  end
  
    # 投稿データの保存
  def create
    @blog = Blog.new(blog_params)
    @blog.customer_id = current_customer.id
    if @blog.save
      redirect_to @blog, notice: '投稿が成功しました。'
    else
      flash.now[:alert] = '投稿に失敗しました。'
      render :new  # 投稿フォームを再表示
    end
  end
  
  def show
    @blog = Blog.find(params[:id])
    # @blogs = @blog.blog_comments
  end
  
  def index
    @all_blogs = Blog.all.order(created_at: :desc)
  end
  
  def my_blogs
    @my_blogs = current_customer.blogs.order(created_at: :desc)
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to @blog, notice: '投稿が更新されました。'
    else
      render :edit
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to my_blogs_blogs_path, notice: 'コメントが削除されました。'
  end
  
  # 投稿データのストロングパラメータ
  private

  def blog_params
    params.require(:blog).permit(:customer_id, :blog_id, :name, :image, :description)
  end
end
