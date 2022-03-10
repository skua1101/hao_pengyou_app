class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.string :event_name, null: false
      t.string :image, null: false
      t.string :date, null: false
      t.text :content, null: false
      t.string :entry_fee, null: false
      t.text :entry_fee_detail, null: false
      t.integer :event_status, default: 0,null: false

      t.timestamps
    end
  end
end
