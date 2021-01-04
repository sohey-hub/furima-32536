class Item < ApplicationRecord

  
  has_one_attached :image
  belongs_to :user
  has_one :purchase_record
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date

end
