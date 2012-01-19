class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :total_quantity, :null => false
      t.decimal :total_price, :null => false
      t.references :user


    end
    add_index :carts, :user_id
  end
end
