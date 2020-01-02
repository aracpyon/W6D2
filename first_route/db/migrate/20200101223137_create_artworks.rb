class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false
    end
    # does oder matter in combination unique pair?
    add_index :artworks, [:title, :artist_id], unique: true
    add_index :artworks, :artist_id, unique: true 
    add_index :artworks, :image_url, unique: true
  end
end
