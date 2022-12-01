require 'rails_helper'

# as a user,
# When I visit an Artist's Songs index
# Then I see the titles of all of that Artists Songs
# And I see that each title is a link to the song's show page

RSpec.describe "Artist's songs index" do 
  before :each do 
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
    @song_3 = @prince.songs.create!(title: "Hello World", length: 34, playcount: 23546)
  end

  it 'shows all of the titles of all of the artists songs' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@song_1.title)
    expect(page).to have_content(@song_2.title)
    expect(page).to have_content(@song_3.title)
  end

  it 'shows each title is a link to the songs show page' do 
    visit "/artists/#{@prince.id}/songs"

    click_on @song_1.title
    expect(current_path).to eq("/songs/#{@song_1.id}") 
    # click_on @song_2.title
    # expect(current_path).to eq("/songs/#{@song_2.id}") 
    # click_on @song_3.title
    # expect(current_path).to eq("/songs/#{@song_3.id}") 
  end

  it 'shows the average song length for the artist' do 
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content("Averge song length: 260.67")
  end
end