require 'rails_helper'

RSpec.describe Artist, type: :model do
  it { should have_many :songs}

  describe 'instance methods' do
    describe 'average song length' do 
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
        @song_3 = @prince.songs.create!(
          title: "Hello World", 
          length: 34, 
          playcount: 23546)
      end
      it 'returns the average song length' do 
        expect(@prince.average_song_length.round(2)).to eq(260.67)
      end
    end
  end

end