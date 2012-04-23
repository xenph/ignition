class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_projects = Project.where('user_id = ?', @user.id)
  end
end