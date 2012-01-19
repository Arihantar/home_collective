class AddUrlAndDescriptionToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :url,         :string
    add_column :events, :description, :text
  end

  def self.down
    remove_column :events, :url
    remove_column :events, :description
  end
end
