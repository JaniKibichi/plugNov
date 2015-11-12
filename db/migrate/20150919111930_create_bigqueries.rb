class CreateBigqueries < ActiveRecord::Migration
  def change
    create_table :bigqueries do |t|
      t.string :text
      t.string :number

      t.timestamps null: false
    end
  end
end
