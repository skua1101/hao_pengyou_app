class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :user_id, null: false
      t.string :event_id, null: false
      t.boolean :is_canceled,default: false, null: false

      t.timestamps
    end
  end
end
