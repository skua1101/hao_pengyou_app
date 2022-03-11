class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :post_code, :string
    add_column :users, :phone_number, :string
    add_column :users, :nationality, :string

  end
end
