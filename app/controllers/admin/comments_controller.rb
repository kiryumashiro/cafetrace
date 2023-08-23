class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy

    @blog_comment = BlogComment.find(params[:id])
    @blog_comment.destroy
    redirect_to admin_blog_path(params[:blog_id]), notice: 'コメントが削除されました。'
    
    
    # @blog.comments = Blog.find(params[:id])
    # @blog.destroy
    # redirect_to admin_blogs_path, notice: '投稿が削除されました。'
    
    # @blog = Blog.find(params[:id])
    # @comments = blog.comments

    
    
    # blog = Blog.find(params[:blog_id])
    # comment = current_customer.blog_comments.new(blog_comment_params)
    # comment.blog_id = blog.id
    # comment.save
    # redirect_to blog_comments_path(blog.id)
    
  end
end
