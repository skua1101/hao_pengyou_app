class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      
      t.string :calendar_title
      t.text :calendar_content
      t.datetime :start_time

      t.timestamps
    end
  end
end
