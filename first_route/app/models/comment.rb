# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  artwork_id :integer          not null
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
    belongs_to :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

    belongs_to :artwork,
    class_name: :Artwork,
    foreign_key: :artwork_id,
    primary_key: :id

    def self.comments_for_id(id)
        Comment
        .joins(:user, :artwork)
        .where(":id = user_id OR :id = artwork_id", id: id)
        .distinct
    end

end


#  def self.artworks_for_user_id(user_id)
#         Artwork
#         .left_outer_joins(:artwork_shares)
        # .where(":user_id = artist_id OR :user_id = viewer_id", user_id: user_id)
#         .distinct
#     end