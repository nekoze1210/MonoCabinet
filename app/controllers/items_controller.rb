# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: %i[show edit update destroy]
  before_action :set_search_q, only: %i[index search]

  def index
    @items = current_user.items.order('created_at DESC')
  end

  def show
    @locations = @item.locations.includes(params[:item_id]).order('created_at DESC')
    @location = @item.locations.new
    @hash = build_gmap_marker(@locations)
    @polylines = @hash.map { |e| e.except(:infowindow, :address) }
  end

  def new
    @item = Item.new
    @item.locations.build
  end

  def edit; end

  def create
    item = Item.new(item_params)
    item.remote_image_url = SearchRakutenItemService.new(item.name).find_thumbnail if item.image.blank? && params[:use_rakuten]
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
      notice[:success] = 'アイテムの情報が更新されました!'
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

  def search
    @items = Item.search(params[:q]).result
  end

  def tweet
    @item = current_user.items.find(params[:id])
    User::TweetItemService.new(@item).execute
    redirect_to root_path, notice: 'ok?'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_search_q
    @q = current_user.items.search
  end

  def build_gmap_marker(locations)
    Gmaps4rails.build_markers(locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow location.created_at.strftime('%-m月%-d日 %H時%M分') + "に登録 (#{location.address})"
      marker.json(address: location.address)
    end
  end

  def item_params
    params.require(:item)
          .permit(
            :name,
            :maker,
            :image,
            locations_attributes:
              %i[latitude
                 longitude
                 user_id]
          ).merge(user_id: current_user.id)
  end
end
