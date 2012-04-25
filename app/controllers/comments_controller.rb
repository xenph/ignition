class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    
    if @comment.save
      redirect_to(@comment.project)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      redirect_to(@comment.project)
    end
  end
end