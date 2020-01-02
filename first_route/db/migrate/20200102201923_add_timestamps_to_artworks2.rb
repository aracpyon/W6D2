class AddTimestampsToArtworks2 < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:artworks, null: true)
  end
end
