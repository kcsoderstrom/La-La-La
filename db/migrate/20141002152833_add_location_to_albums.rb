class AddLocationToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :live, :boolean, default: false, null: false
  end
end
