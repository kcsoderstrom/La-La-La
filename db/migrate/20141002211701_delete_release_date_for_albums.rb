class DeleteReleaseDateForAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :release_date
  end
end
