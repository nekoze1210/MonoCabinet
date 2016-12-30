class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @items = @user.items.includes(:user).order("created_at DESC").page(params[:page]).per(12)
  end

  def show
    @item = current_user.items.find(params[:id])
    @locations = @item.locations.all.order("created_at DESC")
    @location = @item.locations.new
    @location.item_id = @item.id
  end

  def search
    @items = Item.where('item_name LIKE(?)', "%#{params[:keyword]}").limit(20)
  end

  def new
    @user = User.find(params[:user_id])
    @item = Item.new
    @item.locations.build
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.create(item_params)
  end

  def update
    redirect_to controller: :items, action: :show
  end

  def destroy
    item = Item.find(params[:id])
    locations = item.locations.where(item_id: params[:id])
    if item.user_id == current_user.id
      item.destroy
      locations.destroy_all
    end
    redirect_to controller: :items, action: :index
  end

private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :maker, :image, locations_attributes:[:latitude, :longitude, :id, :user_id]).merge(user_id: current_user.id)
  end
end
