class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates :kanji_first_name, presence: true
  validates :kanji_last_name, presence: true
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "には全角カタカナを使用してください"}
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "には全角カタカナを使用してください"}
  validates :birth_date, presence: true

end
