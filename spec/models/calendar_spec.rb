require 'rails_helper'

RSpec.describe Calendar, type: :model do
  before do
    @calendar = FactoryBot.build(:calendar)
  end

   describe 'カレンダー新規登録' do
     context 'カレンダー作成ができるとき' do
        it '全ての項目が正しく入力されている時' do
          expect(@calendar).to be_valid
        end
     end

     context 'カレンダー作成ができないとき' do
        it 'calendar_titleが空では登録できない' do
          @calendar = FactoryBot.build(:calendar, calendar_title: nil)
          @calendar.valid?
          expect(@calendar.errors.full_messages).to include("Calendar titleを入力してください")
        end
        it 'calendar_contentが空では登録できない' do
          @calendar = FactoryBot.build(:calendar, calendar_content: nil)
          @calendar.valid?
          expect(@calendar.errors.full_messages).to include("Calendar contentを入力してください")
        end
     end
   end
end
