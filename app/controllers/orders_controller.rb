class OrdersController < ApplicationController
  before_action :purchase_user, only: [:index]

  def index
  end

  def create
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new(user_item_params)
    if @user_item.valid?
        pay_item
      @user_item.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_item_params
    params.require(:user_item).permit(:postal_code, :prefecture_id, :city_name, :house_number, :building_name, :tel_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: user_item_params[:token],
        currency: 'jpy' 
      )
  end

  def purchase_user
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new
    if user_signed_in? && !@item.order.present?
      unless @item.user == current_user
        render :index
      else
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end
