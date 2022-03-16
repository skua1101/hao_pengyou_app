class RemoveDateToEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :date, :string, null: false
  end
end
