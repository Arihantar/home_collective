class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :login,    :string
      t.column :email,    :string
      t.column :password, :string
    end
    
    # Add a foreign key referene to users in the events table
    add_column :events, :user_id, :integer
  end

  def self.down
    drop_table :users
    remove_column :events, :user_id
  end
end
