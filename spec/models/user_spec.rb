require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe 'ユーザー新規登録' do

     context '登録ができるとき' do
        it '全ての項目が正しく入力されている時' do
          expect(@user).to be_valid
       end
     end

     context '登録ができない' do
        it "emailが空では登録できない" do
        @user = FactoryBot.build(:user, email: nil)
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
        end

        it "last_nameが空では登録できない" do
        @user = FactoryBot.build(:user, last_name: nil)
        @user.valid?
        expect(@user.errors.full_messages).to include("Last nameを入力してください")
        end

        it "first_nameが空では登録できない" do
        @user = FactoryBot.build(:user, first_name: nil)
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameを入力してください")
        end

        it "addressが空では登録できない" do
        @user = FactoryBot.build(:user, address: nil)
        @user.valid?
        expect(@user.errors.full_messages).to include("Addressを入力してください")
        end

        it "phone_numberが空では登録できない" do
        @user = FactoryBot.build(:user, phone_number: nil)
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone numberを入力してください")
        end

        it "post_codeが空では登録できない" do
        @user = FactoryBot.build(:user, post_code: nil)
        @user.valid?
        expect(@user.errors.full_messages).to include("Post codeを入力してください")
        end

        it "nationalityが空では登録できない" do
        @user = FactoryBot.build(:user, nationality: nil)
        @user.valid?
        expect(@user.errors.full_messages).to include("Nationalityを入力してください")
        end

        it "first_name_kanaが空では登録できない" do
        @user = FactoryBot.build(:user, first_name_kana: nil)
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanaを入力してください")
        end

        it "last_name_kana_nameが空では登録できない" do
        @user = FactoryBot.build(:user, last_name_kana: nil)
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanaを入力してください")
        end
     end
   end
end