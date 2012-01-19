class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :name, :null => false
      t.text :content, :null => false
      t.references :admin

      t.timestamps
    end
    add_index :static_pages, :admin_id
  end
end
