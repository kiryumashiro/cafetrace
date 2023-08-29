class Admin::BlogsController < ApplicationController
  before_action :authenticate_admin!

  def customer_blogs
    @customer = Customer.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to admin_path, notice: '投稿が削除されました。'
  end
  
  # 投稿データのストロングパラメータ
  private

  def blog_params
    params.require(:blog).permit(:customer_id, :blog_id, :name, :image, :description)
  end
end
