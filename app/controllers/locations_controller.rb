class LocationsController < ApplicationController
  before_action :authenticate_user!
  # ナクシタ
  def index
    item = current_user.items.find(params[:item_id])
    @locations = item.locations.all.order("created_at DESC")
  end
  # 現在地登録
  def create
    @location = Location.create(location_params)
    redirect_to user_item_locations_path, notice: '位置を更新しました'
  end
  #登録(フォーム)
  def new
    @item = Item.find(params[:item_id])
    @location = Location.new
    @location.item_id = @item.id
  end

  def destroy
  end

private

  def location_params
    params.require(:location).permit(:latitude, :longitude).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
