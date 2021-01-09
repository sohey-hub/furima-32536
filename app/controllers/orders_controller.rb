class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new(user_item_params)
    if @user_item.valid?
      @user_item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_item_params
    params.petmit(:postal_code, :city_name, :house_number, :tel_number ,:user_id)
  end
end
