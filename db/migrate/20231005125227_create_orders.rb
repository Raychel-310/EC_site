class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_postal_code
      t.string :shipping_address
      t.string :shipping_name
      t.integer :payment_method
      t.integer :status, default: 0
      t.integer :payment_amount
      t.integer :postage
      t.timestamps
    end
  end
end
