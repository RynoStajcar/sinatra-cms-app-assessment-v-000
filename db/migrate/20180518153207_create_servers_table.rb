class CreateServersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :username
      t.string :password_digest
      t.integer :pending_orders
      t.integer :completed_orders
    end
  end
end
