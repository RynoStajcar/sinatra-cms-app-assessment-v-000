class CreateOrdersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :server_id
      t.integer :customer_id
      t.integer :drink_ids
    end
  end
end
