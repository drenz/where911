class AddFieldsToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :description, :string
    add_column :videos, :person_name, :string
    add_column :videos, :twitter_handle, :string
    
  end

  def self.down
    remove_column :videos, :description
    remove_column :videos, :name
    remove_column :videos, :twitter_handle    
  end
end
