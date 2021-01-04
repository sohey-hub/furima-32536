require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

   describe '商品登録' do
     context '商品登録ができる時' do
       it "titleとexplain,category_idとcondition_id,priceとdelivery_fee_id,prefecture_idとdelivery_date_id,imageが存在すれば登録できること" do
        expect(@item).to be_valid
       end

       it "商品画像が空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
       end

       it "商品名が空では登録出来ないこと" do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
       end

       it "商品の説明が空では登録出来ないこと" do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
       end

       it "商品のカテゴリーが'---'では登録出来ないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
       end

       it "商品の状態が'---'では登録出来ないこと" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
       end
      
       it "配送料の負担が'---'では登録出来ないこと" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
       end

       it "発送元の地域が'---'では登録出来ないこと" do
         @item.prefecture_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
       end

       it "発送までの日数が'---'では登録出来ないこと" do
         @item.delivery_date_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
       end

       it "価格は半角数字以外を使用すると登録出来ないこと" do
         @item.price = 'aaaaaa'
         @item.valid?
         expect(@item.errors.full_messages).to include("Price には半角数字を使用してください")
       end

       it "価格の範囲が300円〜9,999,999円の範囲外の場合は登録出来ないこと" do
         @item.price = 250
         @item.valid?
         expect(@item.errors.full_messages).to include("Price は範囲外の数値です")
       end
    end 
  end
end