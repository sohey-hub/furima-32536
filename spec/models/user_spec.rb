require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
   context '新規登録できる時' do
     it "nicknameとemail,passwordとencrypted_password,kanji_first_nameとkanji_last_name,kana_first_nameとkana_last_name,birth_dateが存在すれば登録出来ること" do
      expect(@user).to be_valid
     end
     it "passwordとencrypetd_passwordが６文字以上であれば登録できる" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
     end
   end

   context '新規登録出来ない時' do
     it "nicknameが空では登録出来ない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録出来ない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it " 重複したemailが存在する場合登録出来ない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it "passwordが空では登録出来ない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "passwordが５文字以下では登録出来ない" do
      @user.password = "12345"
      @user.encrypted_password = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
     end

     it "kanji_first_nameが空では登録出来ない" do
       @user.kanji_first_name = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
     end
     it "kanji_last_nameが空では登録出来ない" do
       @user.kanji_last_name = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
     end
     it "kana_first_nameが空では登録出来ない" do
       @user.kana_first_name = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Kana first name can't be blank")
     end
     it "kana_last_nameが空では登録出来ない" do
       @user.kana_last_name = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Kana last name can't be blank")
     end
     it "birth_dateが空では登録出来ない" do
       @user.birth_date = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Birth date can't be blank")
     end
   end
 end
end