require 'rails_helper'

RSpec.describe UserItem, type: :model do
  before do
    @user_item = FactoryBot.build(:user_item)
  end

  describe "商品購入登録" do
    context '商品購入ができる時' do
      it 'postal_codeとprefecture_id,city_nameとhouse_number,tel_numberとtoken,user_idとitem_idが存在すれば登録できること' do
        expect(@user_item).to be_valid
      end
    end

    context '商品購入ができない時' do
      it "郵便番号が空では登録できないこと" do
        @user_item.postal_code = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code can't be blank")
      end

      it "配送先の地域が'---'では登録できないこと" do
        @user_item.prefecture_id = 1
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "市区町村の名前が空では登録できないこと" do
        @user_item.city_name = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("City name can't be blank")
      end

      it "番地が空では登録できないこと" do
        @user_item.house_number = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("House number can't be blank")
      end

      it "電話番号が空では登録できないこと"  do
        @user_item.tel_number = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Tel number can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @user_item.token = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
