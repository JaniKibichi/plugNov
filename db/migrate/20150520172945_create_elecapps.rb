class CreateElecapps < ActiveRecord::Migration
  def change
    create_table :elecapps do |t|
      t.string :from
      t.string :to
      t.float :text
      t.date :date
      t.string :ATXid
      t.string :linkId

      t.timestamps null: false
    end
  end
end
