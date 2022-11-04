class UsersController < ApplicationController

  before_action :set_user, only: [:show]
  
  def show
    @transferences = @user.account.transferences.order(created_at: :desc)
  end

  private

  def set_user
    @user = current_user
  end

end