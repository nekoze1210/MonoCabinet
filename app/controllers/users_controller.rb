# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    @user.update(user_params)

    redirect_to root_path, notice: 'ユーザー情報が更新されました。'
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(
      :email,
      :nickname,
      :avatar,
      :password,
      :password_confirmation
    ).to_h
  end
end
