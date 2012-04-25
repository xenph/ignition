class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    
    unless @comment.save
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      redirect_to "/projects/#{@comment.event.project.id}\#discussion"
    end
    
    redirect_to "/projects/#{@comment.event.project.id}\#comment-#{@comment.id}"
  end
end