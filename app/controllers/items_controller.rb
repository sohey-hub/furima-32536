class ItemsController < ApplicationController
  def index
  end
  def new

  end

  private

  def item_params
    params.require(:item).permit(:title, :explain, :category_id, :condition_id, :price, :delivery_fee_id, :prefecture_id, :delivery_date_id, :image).merge(user_id: current_user.id)
    
  end
end
