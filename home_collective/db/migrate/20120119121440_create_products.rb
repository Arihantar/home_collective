class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :null => false
      t.string :product_code, :null => false
      t.text :description, :null => false
      t.decimal :price, :null => false
      t.integer :discount, :null => true
      t.integer :delivery_min_range, :null => true
      t.integer :delivery_max_range, :null => true
      t.integer :stock, :null => false
      t.integer :reorder_level, :null => false
      t.references :admin

      t.timestamps
    end
    add_index :products, :admin_id
  end
end
