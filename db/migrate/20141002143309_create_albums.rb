class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.date :release_date
      t.references :band, index: true, null: false

      t.timestamps
    end
  end
end
