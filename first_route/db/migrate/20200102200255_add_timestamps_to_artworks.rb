class AddTimestampsToArtworks < ActiveRecord::Migration[5.2]
  #  def up
  #   add_timestamps(:artworks)
  # end

  def down
    remove_timestamps(:artworks)
  end
end
