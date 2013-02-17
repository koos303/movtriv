require 'spec_helper'

describe MoviesController do
  include Devise::TestHelpers

  before do
    @admin = create(:admin)
    sign_in @admin
  end

  describe "#index" do
    it "assigns @movies" do
      get :index
      assigns(:movies).should_not be_nil
    end
  end

  describe "#new" do
    it "assigns @movie" do
      get :new
      assigns(:movie).should be_a_new(Movie)
    end
  end

  describe "#create" do
    it "creates a new MovieFilm" do
      expect {
        post :create, movie: { title: "Borat", imdb_link: "http://t.co" }
      }.to change { Movie.count }.from(0).to(1)
    end

    it "creates a movie with screenshots" do
      expect {
        screenshot = create :screenshot
        post :create, movie: { title: "Borat", imdb_link: "http://t.co" }, screenshots: [screenshot]
      }.to change { Screenshot.count }.from(0).to(1)
    end

    it "doesn't create a movie with invalid parameters" do
      expect {
        post :create, movie: { title: "Borat" }
      }.not_to change { Movie.count }.from(0).to(1)
    end

    it "renders the new template" do
      post :create, movie: { title: "Borat" }
      response.should render_template("new")
    end
  end

  let(:movie) { create :movie, imdb_link: "http://t.co" }

  describe "#show" do
    it "assigns @movie" do
      get :show, :id => movie.id
      assigns(:movie).should eq(movie)
    end
  end

  describe "#edit" do
    it "finds the movie" do
      get :edit, :id => movie.id
      assigns(:movie).should eq(movie)
    end
  end

  describe "#update" do
    it "updates the movie" do
      put :update, id: movie.id, movie: {title: "Clockwork Orange"}
      movie.reload
      movie.title.should eql "Clockwork Orange"
    end

    it "renders the edit template" do
      put :update, id: movie.id, movie: {imdb_link: "holler"}
      response.should render_template("edit")
    end
  end
end
