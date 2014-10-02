class AddReleaseYearToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :release_year, :integer
  end
end
