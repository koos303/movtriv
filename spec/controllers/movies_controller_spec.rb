require 'spec_helper'

describe MoviesController do
    describe "#index" do
      it "assigns movies" do
        get :index
        assigns(:movies).should_not be_nil
      end
    end
end
