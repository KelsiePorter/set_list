require 'rails_helper'

RSpec.describe 'the songs show page' do
  # User story 1: As a visitor, when I visit /songs/1 (1 is the)
  # id of a song in my database). Then I see that song's title,
  # and artist. And I do not see any other songs in my database.
  it 'displays the song title' do 
    artist = Artist.create(name: "Cher")
    song = artist.songs.create!(title: "I like you", length: 208, playcount: 346)
    song_2 = artist.songs.create!(title: "Park ROck", length: 290, playcount: 1546)
    
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end 

  it 'displays the name of the artist for the song' do 
    artist = Artist.create(name: "Cher")
    song = artist.songs.create!(title: "I like you", length: 208, playcount: 346)
    song_2 = artist.songs.create!(title: "Park ROck", length: 290, playcount: 1546)
    
    visit "/songs/#{song.id}"
    # save_and_open_page
    expect(page).to have_content(artist.name)
  end
end