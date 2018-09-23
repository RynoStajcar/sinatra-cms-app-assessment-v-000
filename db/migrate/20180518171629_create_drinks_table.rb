class CreateDrinksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.integer :customer_id
      t.string :name
      t.float :price
    end
  end
end
