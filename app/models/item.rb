class Item < ApplicationRecord

  validates :image, presence: true
  validates :title, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "には半角数字を使用してください" }
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_date_id, presence: true

  has_one_attached :image
  belongs_to :user
  has_one :purchase_record

end
