class ItemFurima

  include ActiveModel::Model
  attr_accessor
 
 with_options presence: true do
  validates :image
  validates :title
  validates :explain
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: "には半角数字を使用してください"}
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は範囲外の数値です"}
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 }
 end
end