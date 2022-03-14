class AddEventAddressToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :event_address, :string
  end
end
