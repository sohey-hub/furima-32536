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
      
      it "building_nameは空でも登録できること" do
        @user_item.building_name = nil
        expect(@user_item).to be_valid
      end
    end

    context '商品購入ができない時' do
      it "郵便番号が空では登録できないこと" do
        @user_item.postal_code = nil
        binding.pry
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code can't be blank")
      end

      it "郵便番号がハイフンなしでは登録できないこと"  do
        @user_item.postal_code = 1234567
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code にはハイフン(-)を必ず入れてください")
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

      it "電話番号が空では登録できないこと" do
        @user_item.tel_number = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Tel number can't be blank")
      end

      it "電話番号が１２桁以上では登録できないこと" do
        @user_item.tel_number = 123456789123456
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Tel number には１１桁の数字のみを入力してください")
      end

      it "電話番号が英数混合では登録できないこと" do
        @user_item.tel_number = "123456789abc"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Tel number には１１桁の数字のみを入力してください")
      end

      it "tokenが空では登録できないこと" do
        @user_item.token = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では登録できないこと"  do
        @user_item.user_id = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では登録できないこと" do
        @user_item.item_id = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
