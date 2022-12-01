# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@prince = Artist.create!(name: "Prince")
@song_1 = Song.create!(
  title: "Purple Rain",
  length: 324,
  playcount:2345,
  artist_id: @prince.id
)
@song_2 = Song.create!(
  title: "Raspberry Beret",
  length: 424,
  playcount:234555,
  artist_id: @prince.id
)
@song_3 = @prince.songs.create!(
  title: "Hello World", 
  length: 34, 
  playcount: 23546)