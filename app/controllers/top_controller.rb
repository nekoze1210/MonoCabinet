class TopController < ApplicationController
before_action :move_to_items
  def welcome
  end

  def help
  end

    def after_sign_out_path_for(resource)
    '???' # サインアウト後のリダイレクト先URL
  end


private
  def move_to_items
    redirect_to '/items' if user_signed_in?
  end


end
