class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_search_q, only: [:index, :search]

  def index
    @items = current_user.items.order("created_at DESC").page(params[:page]).per(12)
    flash[:notice] ="test"
  end

  def show
    @locations = @item.locations.includes(params[:item_id]).order("created_at DESC")
    @location = @item.locations.new
  end

  def search
    @items = Item.search(params[:q]).result
  end

  def new
    @item = Item.new
    @item.locations.build
  end

  def edit
  end

  def create
    item = Item.new(item_params)
    item.remote_image_url = SearchRakutenItemService.new(item.item_name).find_thumbnail if item.image.blank? && params[:use_rakuten]
    if item.save
      redirect_to user_items_path(current_user), notice: 'アイテムの情報が登録されました。'
    else
      flash[:alert] = 'Error!: アイテムの情報が登録されませんでした。'
      render :new
    end
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

  def set_search_q
    @q = current_user.items.search
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
