class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name, :null => false
      t.references :product
      t.references :admin

      t.timestamps
    end
    add_index :images, :product_id
    add_index :images, :admin_id
  end
end
