require 'spec_helper'

describe Movie do
  it "has required fields" do
    movie = Movie.new
    movie.save

    movie.should have(1).error_on(:title)
    movie.should have(1).error_on(:imdb_link)
  end

  it { should have_many(:screenshots) }
end
