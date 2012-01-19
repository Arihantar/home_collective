class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :desciption, :null => false
      t.references :delivery

      t.timestamps
    end
    add_index :feedbacks, :delivery_id
  end
end
