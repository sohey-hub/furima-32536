class UserItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city_name, :house_number, :building_name, :tel_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code,   format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはハイフン(-)を必ず入れてください" }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city_name
    validates :house_number
    validates :tel_number,    format: { with: /\A\d{11}\z/, message: "には１１桁の数字のみを入力してください" }
    validates :token
    validates :user_id
    validates :item_id
  end

   def save
     order = Order.create(user_id: user_id, item_id: item_id)
     Address.create(prefecture_id: prefecture_id, postal_code: postal_code, city_name: city_name, house_number: house_number, tel_number: tel_number, building_name: building_name, order_id: order.id)
   end
end