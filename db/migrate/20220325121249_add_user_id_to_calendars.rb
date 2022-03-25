class AddUserIdToCalendars < ActiveRecord::Migration[6.1]
  def change
    add_column :calendars, :user_id, :integer
  end
end
