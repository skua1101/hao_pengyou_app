class AddDetailsToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :relationship_id, :integer
    add_column :notifications, :chat_id, :integer
  end
end
