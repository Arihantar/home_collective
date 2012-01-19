class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :cart
      t.references :product
      t.integer :quantity, :null => false


    end
    add_index :cart_items, :cart_id
    add_index :cart_items, :product_id
  end
end
