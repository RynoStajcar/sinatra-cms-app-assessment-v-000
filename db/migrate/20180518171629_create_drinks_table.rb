class CreateDrinksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.float :price
      t.integer :order_id
    end
  end
end
