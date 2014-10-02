class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.references :album, index: true, null: false

      t.timestamps
    end
  end
end
