class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, :null => false
      t.references :state


    end
    add_index :cities, :state_id
  end
end
