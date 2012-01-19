class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.references :order
      t.text :problem, :null => false
      t.string :status, :null => false, :default => "PENDING"

      t.timestamps
    end
    add_index :complaints, :order_id
  end
end
