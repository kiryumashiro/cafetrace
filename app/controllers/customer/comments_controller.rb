class Customer::CommentsController < ApplicationController
    
  def index
     @blog = Blog.find(params[:blog_id])
     @blog_comment = BlogComment.new
  end
    
  def create
    blog = Blog.find(params[:blog_id])
    comment = current_customer.blog_comments.new(blog_comment_params)
    comment.blog_id = blog.id
    comment.save
    redirect_to blog_comments_path(blog.id)
  end

  private
  def blog_comment_params
    params.require(:blog_comment).permit(:customer_id, :comment, :blog_id)
  end
  
end
