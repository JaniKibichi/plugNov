class AddEstateToUser < ActiveRecord::Migration
  def change
    add_column :users, :estate, :string
  end
end
