class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.column :user_id,    :integer
      t.column :event_id,   :integer
      t.column :note,       :text
      t.column :created_at, :datetime
    end
  end

  def self.down
    drop_table :registrations
  end
end
