class AddRoomsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rooms, :string
  end
end
