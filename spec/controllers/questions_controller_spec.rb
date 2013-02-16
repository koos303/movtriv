require 'spec_helper'

describe QuestionsController do
  before do
    @movie1 = create :movie, title: "Matrix, the"
    @movie2 = create :movie, title: "Glitter"
    @movie3 = create :movie, title: "Crossroads"
    @question = create :question, :answer => @movie1, :others => [@movie2, @movie3]
  end

  describe "#play" do
    it "assigns @question" do
      get :play
      assigns(:question).should_not be_nil
    end

    it "builds the @options" do
      get :play
      assigns(:options).should have(3).items
    end
  end

  describe "#check" do
    it "finds the @question" do
      post :check, question_id: @question.id
      assigns(:question).should eq(@question)
    end

    it "sets the 'right' flash message" do
      post :check, question_id: @question.id, answer: @movie1.id
      flash[:right].should be_present
    end

    it "sets the 'wrong' flash message" do
      post :check, question_id: @question.id, answer: @movie2.id
      flash[:wrong].should be_present
    end
  end
end
