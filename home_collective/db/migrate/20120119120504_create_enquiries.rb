class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :email, :null => false
      t.string :contact_number, :null => false
      t.text :content, :null => false

      t.timestamps
    end
  end
end
