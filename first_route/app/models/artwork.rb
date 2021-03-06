# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true

    belongs_to :artist,
        class_name: :User,
        foreign_key: :artist_id,
        primary_key: :id

    has_many :artwork_shares, 
        class_name: :ArtworkShare,
        foreign_key: :artwork_id,
        primary_key: :id,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer
        
    has_many :comments,
        class_name: :Comment,
        foreign_key: :artwork_id,
        primary_key: :id,
        dependent: :destroy

    def self.artworks_for_user_id(user_id)
        Artwork
        .left_outer_joins(:artwork_shares)
        .where(":user_id = artist_id OR :user_id = viewer_id", user_id: user_id)
        .distinct
    end

end

