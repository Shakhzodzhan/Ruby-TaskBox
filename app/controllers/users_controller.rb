class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      render 'users/index'
    else
      redirect_to new_user_session_path
    end
  end
end
