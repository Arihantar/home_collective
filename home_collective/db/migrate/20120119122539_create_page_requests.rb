class CreatePageRequests < ActiveRecord::Migration
  def change
    create_table :page_requests do |t|
      t.string :path
      t.integer :page_duration
      t.integer :db_duration

      t.timestamps
    end
  end
end
