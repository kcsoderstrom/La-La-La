class CreateNotesTable < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user, null: false
      t.references :track, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
