class AddColumnsToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :venue, :string
    add_column :events, :evet_address, :string
    add_column :events, :event_address, :string
    a
  end
end
