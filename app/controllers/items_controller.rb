class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @user = current_user
    @items = @user.items.includes(:user).order("created_at DESC").page(params[:page]).per(12)
  end
  # GET /items/1
  # GET /items/1.json
  def show
    @item = current_user.items.find(params[:id])
    # index
    @locations = @item.locations.all.order("created_at DESC").page(params[:page]).per(3)
    # new
    @location = Location.new
    @location.item_id = @item.id
  end

  def search
    @items = Item.where('item_name LIKE(?)', "%#{params[:keyword]}").limit(20)
  end

  # GET /items/new
  def new
    @user = User.find(params[:user_id])
    @item = Item.new
    @item.locations.build
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.create(item_params)
    # respond_to do |format|
    #   if @item.save
    #     format.html { redirect_to @item, notice: '登録されました。' }
    #     format.json { render :show, status: :created, location: @item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    redirect_to controller: :items, action: :show
    # respond_to do |format|
    #   if @item.update(item_params)
    #     format.html { redirect_to @item, notice: '編集されました。' }
    #     format.json { render :show, status: :ok, location: @item }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    item = Item.find(params[:id])
    locations = item.locations.where(item_id: params[:id])
    if item.user_id == current_user.id
      item.destroy
      locations.destroy_all
    end
    redirect_to controller: :items, action: :index
    # @item.destroy
    # respond_to do |format|
    #   format.html { redirect_to items_url, notice: '削除されました。' }
    #   format.json { head :no_content }
    # end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params

      params.require(:item).permit(:item_name, :maker, :image, locations_attributes:[:latitude, :longitude, :id]).merge(user_id: current_user.id)
      end

end
