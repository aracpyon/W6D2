class ChangeTimeStampsToArtworks < ActiveRecord::Migration[5.2]
  def change
    change_column_null :artworks, :created_at, false
    change_column_null :artworks, :updated_at, false
  end
end
