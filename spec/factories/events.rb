FactoryBot.define do
  factory :event do
  association :user
  event_name {"原宿でカフェ会"}
  content{"原宿のカフェで２時間ほど言語学習しましょう"}
  entry_fee{"1000円"}
  entry_fee_detail{"ドリンク２杯"}
  # event_status{"鈴木"}
  venue{"原宿CAFE"}
  event_address{"東京都原宿1−1−１"}
  event_date{"2020/10/01"}

  Event.event_statuses.keys.each do |status|
      trait :"#{status}" do
        status { status }
      end
    end
  end
end
