class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :product
      t.decimal :total_price, :null => false
      t.integer :quantity, :null => false

      t.timestamps
    end
    add_index :purchases, :product_id
  end
end
