class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :user
      t.string :provider
      t.string :uid
      t.string :uname
      t.string :uemail


    end
    add_index :services, :user_id
  end
end
