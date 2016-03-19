class TopController < ApplicationController
before_action :move_to_items
  def welcome
  end

  def help
  end


private
  def move_to_items
    redirect_to user_items_path(current_user) if user_signed_in?
  end


end
