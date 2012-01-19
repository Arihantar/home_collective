class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, :null => false
      t.references :country


    end
    add_index :states, :country_id
  end
end
