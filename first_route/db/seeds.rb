# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# def rand_id
#   rand(1..100_000)
# end

ActiveRecord::Base.transaction do

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

# alpha = Company.create(
#     id: rand_id,
#     name: 'Alphabet',
#     website: 'google.com',
#     market_cap: 3000,
#     ticker_symbol: 'ABCD',
#     exchange_id: nyse.id
#   )

puts 'Beginning to seed'
# Artists
leo = User.create(username: "Leonardo da Vinci") 
vincent = User.create(username: "Vincent van Gosh")
frida = User.create(username: "Frida Khalo")
dali = User.create(username: "Salvador Dalí")
georgia = User.create(username: "Georgia O'Keeffe") 
ara = User.create(username: "Ara Cho")

# Viewers
jay = User.create(username: "Jay82")
ciel = User.create(username: "Ciel")
alex = User.create(username: "Alex")
rob = User.create(username: "Rob")
akeem = User.create(username: "Akeem")
phong = User.create(username: "PhongthePhunniest")

# Artworks
last_supper = Artwork.create(
    title: "Last Supper", 
    image_url: "google.com/last_supper", 
    artist_id: leo.id
    )
monalisa = Artwork.create(
    title: "Mona Lisa",
    image_url: "google.com/monalisa",
    artist_id: leo.id
)
self_portrait_necklace = Artwork.create(
    title: "self Portrait with necklace",
    image_url: "wikipedia.ord/en/frida-kahlo",
    artist_id: frida.id
)
starry_night = Artwork.create(
    title: "The Starry Night", 
    image_url: "google.com/starry_night", 
    artist_id: vincent.id
    )
black_iris = Artwork.create(
    title: "Black Iris", 
    image_url: "google.com/black_iris", 
    artist_id: georgia.id
)

venus_is_born = Artwork.create(
    title: "Venus Is Born",
    image_url: "arachoart.com",
    artist_id: ara.id
)
persistence_of_memory = Artwork.create(
    title: "Persistance of Memory",
    image_url: "google.com/persistence-of-memory",
    artist_id: dali.id
)


ArtworkShare.create(artwork_id: last_supper.id, viewer_id: phong.id)
ArtworkShare.create(artwork_id: last_supper.id, viewer_id: akeem.id)
ArtworkShare.create(artwork_id: venus_is_born.id, viewer_id: jay.id)
ArtworkShare.create(artwork_id: venus_is_born.id, viewer_id: ciel.id)
ArtworkShare.create(artwork_id: venus_is_born.id, viewer_id: rob.id)
ArtworkShare.create(artwork_id: venus_is_born.id, viewer_id: phong.id)
ArtworkShare.create(artwork_id: monalisa.id, viewer_id: phong.id)
ArtworkShare.create(artwork_id: monalisa.id, viewer_id: akeem.id)
ArtworkShare.create(artwork_id: monalisa.id, viewer_id: rob.id)
ArtworkShare.create(artwork_id: monalisa.id, viewer_id: jay.id)
ArtworkShare.create(artwork_id: black_iris.id, viewer_id: ciel.id)
ArtworkShare.create(artwork_id: black_iris.id, viewer_id: ara.id)
ArtworkShare.create(artwork_id: black_iris.id, viewer_id: akeem.id)
ArtworkShare.create(artwork_id: self_portrait_necklace.id, viewer_id: akeem.id)
ArtworkShare.create(artwork_id: self_portrait_necklace.id, viewer_id: ara.id)
ArtworkShare.create(artwork_id: starry_night.id, viewer_id: ara.id)
ArtworkShare.create(artwork_id: starry_night.id, viewer_id: jay.id)

puts 'Seeding complete'
end
