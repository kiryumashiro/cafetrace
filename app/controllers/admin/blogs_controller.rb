class Admin::BlogsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    # @customer = Customer.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to admin_blogs_path, notice: '投稿が削除されました。'
  end
end
