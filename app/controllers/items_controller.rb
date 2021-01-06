class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
 
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

  private

  def item_params
    params.require(:item).permit(:title, :explain, :category_id, :condition_id, :price, :delivery_fee_id, :prefecture_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end
end
