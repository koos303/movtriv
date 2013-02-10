require 'spec_helper'

describe Movie do
  it "has required fields" do
    movie = Movie.new
    movie.save

    movie.should have(1).error_on(:title)
    movie.should have(1).error_on(:imdb_link)
  end

  it { should have_many(:screenshots) }

  context "imdb link" do
    it "rejects invalid url" do
      movie = build :movie, imdb_link: "in-addr.arpa"
      movie.should have(1).error_on(:imdb_link)
    end

    it "accepts valid uri" do
      movie = create :movie, imdb_link: "http://t.co"
      movie.should have(:no).errors_on(:url)
    end
  end
end
