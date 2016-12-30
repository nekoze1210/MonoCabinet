class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    # binding.pry
    @location = Location.create(location_params)
    redirect_to user_item_path(@location.item.user, @location.item), notice: '位置を更新しました'
  end

  def new
    @user = User.find(params[:id])
    @item = Item.find(params[:item_id])
    @location = Location.new
    @location.item_id = @item.id
  end

  def destroy
  end

private

  def set_user
    @user = current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:latitude, :longitude).merge(item_id: params[:item_id])
  end
end
