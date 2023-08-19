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
  end
  
  # 投稿データのストロングパラメータ
  private

  def blog_params
    params.require(:blog).permit(:name, :image, :description)
  end
end
