class CreateCustomersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.integer :tabulation
      t.string :created_drink
    end
  end
end
