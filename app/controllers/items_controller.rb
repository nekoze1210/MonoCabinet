class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show, :new]

  def index
    @items = @user.items.order("created_at DESC").page(params[:page]).per(12)
  end

  def show
    @item = current_user.items.find(params[:id])
    @locations = @item.locations.includes(params[:item_id]).order("created_at DESC")
    @location = @item.locations.new
  end

  def search
    @items = Item.where('item_name LIKE(?)', "%#{params[:keyword]}").limit(20)
  end

  def new
    @item = Item.new
    @item.locations.build
  end

  def edit
  end

  def create
    @item = Item.create(item_params)
  end

  def update
    if @item.update
      redirect_to controller: :items, action: :show
      notice[:success] = "アイテムの情報が更新されました!"
    else
      render :edit
    end
  end

  def destroy
    locations = @item.locations.where(item_id: params[:id])
    if @item.user_id == current_user.id
      @item.destroy
      locations.destroy_all
    end
    redirect_to controller: :items, action: :index
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @user = User.find(current_user)
  end

  def item_params
    params.require(:item)
    .permit(
      :item_name,
      :maker,
      :image,
      locations_attributes:
        [:latitude,
         :longitude,
         :user_id]).merge(user_id: current_user.id)
  end
end
