class UserItem
  include ActiveModel::Model
  attr_accessor :image, :title, :explain, :category_id, :condition_id, :price, :delivery_fee_id, :prefecture_id, :delivery_date_id, :postal_code, :city_name, :house_number, :tel_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはハイフン(-)を必ず入れてください" }
    validates :prefecture_id
    validates :city_name
    validates :house_number
    validates :tel_number
   end

   def save
     Address.create(prefecture_id: prefecture_id, postal_code: postal_code, city_name: city_name, house_number: house_number, tel_number: tel_number, user_id: user.id, id: item.id)
   end
end