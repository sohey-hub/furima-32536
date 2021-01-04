class UserFurima

  include ActiveModel::Model
  attr_accessor 

 with_options presence: true do
  validates :nickname
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates :kanji_first_name
  validates :kanji_last_name
  validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "には全角カタカナを使用してください"}
  validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "には全角カタカナを使用してください"}
  validates :birth_date
 end
end