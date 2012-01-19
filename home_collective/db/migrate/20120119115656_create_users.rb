class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false, :unique => true
      t.integer :mobile_number, :null => false
      t.integer :landline_number, :null => true

      t.timestamps
    end
    add_index :users, :email
  end
end
