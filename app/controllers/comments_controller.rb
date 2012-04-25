class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    
    if @comment.save
      redirect_to(@comment.event.project)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      redirect_to(@comment.event.project)
    end
  end
end