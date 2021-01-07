class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit]

 
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
      @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id), method: :get
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :explain, :category_id, :condition_id, :price, :delivery_fee_id, :prefecture_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end

  def correct_user
    @item = Item.find(params[:id])
    if user_signed_in? && @item.user == current_user
      render :edit
    else 
      redirect_to root_path
    end
  end
end
