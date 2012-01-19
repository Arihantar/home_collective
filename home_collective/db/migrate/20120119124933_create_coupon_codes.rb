class CreateCouponCodes < ActiveRecord::Migration
  def change
    create_table :coupon_codes do |t|
      t.string :name, :null => false
      t.datetime :validity_start_date, :null => false
      t.datetime :validity_end_date, :null => true
      t.integer :discount, :null => false
      t.references :admin
      t.boolean :is_for_total_amount, :null => false

      t.timestamps
    end
    add_index :coupon_codes, :admin_id
  end
end
