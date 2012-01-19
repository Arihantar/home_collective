class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.string :label, :null => false
      t.text :address, :null => false
      t.string :pincode, :null => false
      t.references :state
      t.references :city
      t.references :user


    end
    add_index :user_details, :state_id
    add_index :user_details, :city_id
    add_index :user_details, :user_id
  end
end
