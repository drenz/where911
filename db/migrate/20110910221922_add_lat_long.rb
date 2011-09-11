class AddLatLong < ActiveRecord::Migration
  def self.up
    add_column :videos, :latitude, :decimal, :precision => 15, :scale => 10
    add_column :videos, :longitude, :decimal, :precision => 15, :scale => 10    
  end

  def self.down
    remove_column :videos, :latitude
    remove_column :videos, :longitude
    
  end
end
