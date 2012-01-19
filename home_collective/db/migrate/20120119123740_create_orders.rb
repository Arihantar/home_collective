class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :type, :null => false, :default => "NORMAL"
      t.integer :total_quantity, :null => false
      t.decimal :total_price, :null => false
      t.string :pay_type, :null => false
      t.string :recipient, :null => false
      t.text :address, :null => false
      t.references :city
      t.references :state
      t.string :pincode, :null => false
      t.references :user

      t.timestamps
    end
    add_index :orders, :city_id
    add_index :orders, :state_id
    add_index :orders, :user_id
  end
end
