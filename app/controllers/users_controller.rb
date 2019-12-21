# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @items = current_user.items
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to root_path, notice: 'ユーザー情報が更新されました。'
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :password, :password_confirmation, :avatar)
  end
end
