# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
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
        primary_key: :id
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer
end

