class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.references :order
      t.string :tracking_code, :null => true
      t.string :status, :null => false, :default => "NOT SHIPPED"
      t.datetime :shipped_at, :null => true
      t.datetime :received_at, :null => true
      t.references :admin

      t.timestamps
    end
    add_index :deliveries, :order_id
    add_index :deliveries, :admin_id
  end
end
