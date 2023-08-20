class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to blog_path(@comment.blog), notice: 'コメントが削除されました。'
  end
end
