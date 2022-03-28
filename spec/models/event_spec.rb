require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

   describe 'イベント新規登録' do
     context 'イベント作成ができるとき' do
        it '全ての項目が正しく入力されている時' do
          expect(@event).to be_valid
        end
     end

     context 'イベント作成ができないとき' do
        it 'event_nameが空では登録できない' do
          @event = FactoryBot.build(:event, event_name: nil)
          @event.valid?
          expect(@event.errors.full_messages).to include("Event nameを入力してください")
        end

         it 'user_idが空では登録できない' do
          @event = FactoryBot.build(:event, user_id: nil)
          @event.valid?
          expect(@event.errors.full_messages).to include("Userを入力してください")
        end

        it 'contentが空では登録できない' do
          @event = FactoryBot.build(:event, content: nil)
          @event.valid?
          expect(@event.errors.full_messages).to include("Contentを入力してください")
        end

        it 'entry_feeが空では登録できない' do
          @event = FactoryBot.build(:event, entry_fee: nil)
          @event.valid?
          expect(@event.errors.full_messages).to include("Entry feeを入力してください")
        end

        it 'entry_fee_detailが空では登録できない' do
          @event = FactoryBot.build(:event, entry_fee_detail: nil)
          @event.valid?
          expect(@event.errors.full_messages).to include("Entry fee detailを入力してください")
        end

        it 'venueが空では登録できない' do
          @event = FactoryBot.build(:event, venue: nil)
          @event.valid?
          expect(@event.errors.full_messages).to include("Venueを入力してください")
        end

        it 'event_addressが空では登録できない' do
          @event = FactoryBot.build(:event, event_address: nil)
          @event.valid?
          expect(@event.errors.full_messages).to include("Event addressを入力してください")
        end

        it 'event_dateが空では登録できない' do
          @event = FactoryBot.build(:event, event_date: nil)
          @event.valid?
          expect(@event.errors.full_messages).to include("Event dateを入力してください")
        end

        it 'event_statusが空では登録できない' do
          @event = FactoryBot.build(:event, event_status: nil)
          @event.valid?
          expect(@event.errors.full_messages).to include("Event statusを入力してください")
        end
     end
   end
end
