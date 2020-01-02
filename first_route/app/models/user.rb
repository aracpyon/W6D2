# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
    validates :username, presence: true 
    
    has_many :artworks,
        class_name: :Artwork,
        foreign_key: :artist_id,
        primary_key: :id,
        dependent: :destroy
    
    has_many :viewed_artworks,
        class_name: :ArtworkShare,
        foreign_key: :viewer_id,
        primary_key: :id,
        dependent: :destroy

    has_many :shared_artworks,
        through: :viewed_artworks,
        source: :artwork

    has_many :comments,
    class_name: :Comment,
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy

    # def self.find_user(id)
    #     User
        
    # end
end
