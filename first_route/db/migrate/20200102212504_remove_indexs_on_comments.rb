class RemoveIndexsOnComments < ActiveRecord::Migration[5.2]
  def change
    remove_index :comments, :user_id
    remove_index :comments, :artwork_id
  end
end
