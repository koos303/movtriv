require 'spec_helper'

describe MoviesController do
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

    describe "#show" do
      it "assigns @movie" do
        movie = create :movie, imdb_link: "http://t.co"
        get :show, :id => movie.id
        assigns(:movie).should == movie
      end
    end
end
