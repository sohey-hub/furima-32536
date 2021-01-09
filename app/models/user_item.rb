class UserItem
  include ActiveModel::Model
  attr_accessor :nickname, :kanji_fist_name, :kanji_last_name, :kana_first_name, :kana_last_name, :birth_date, :image, :title, :explain, :category_id, :condition_id, :price, :delivery_fee_id, :prefecture_id, :delivery_date_id, :postal_code, :city_name, :house_number, :tel_number

  with_options presence: true do
    validates :nickname
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
    validates :kanji_first_name
    validates :kanji_last_name
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "には全角カタカナを使用してください"}
    validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "には全角カタカナを使用してください"}
    validates :birth_date
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
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはハイフン(-)を必ず入れてください" }
    validates :city_name
    validates :house_number
    validates :tel_number
   end

   def save
     user = User.create(nickname: nickname, password: password, kanji_fist_name: kanji_fist_name, kanji_last_name: kanji_last_name, kana_first_name: kana_first_name, kana_last_name: kana_last_name, birth_date: birth_date)
     Item.create(image: image, title: title, explain: explain, category_id: category_id, condition_id: condition_id,price: price, delivery_fee_id: delivery_fee_id, prefecture_id: prefecture_id, delivery_date_id: delivery_date_id, user_id: user.id)
     Address.create(prefecture_id: prefecture_id, postal_code: postal_code, city_name: city_name, house_number: house_number, tel_number: tel_number, user_id: user.id)
   end
end