class Item < ApplicationRecord

  validates :image, presence: true
  validates :title, presence: true
  validates :explain, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { with: /\A[0-9]+\z/, message: "には半角数字を使用してください"}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は範囲外の数値です"}
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 }

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
