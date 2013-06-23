require 'spec_helper'

describe QuestionGenerator do
  context "not enough movies in db" do
    it "raises an exception" do
      expect {
        QuestionGenerator.update
      }.to raise_error("Not enough movies in database")
    end
  end

  context "3 movies in db" do
    before do
      @movie1 = create :movie
      @movie2 = create :movie
      @movie3 = create :movie
    end

    it "doesn't raise an exception do" do
      expect {
        QuestionGenerator.update
      }.not_to raise_error("Not enough movies in database")
    end

    it "generates questions" do
      expect {
        QuestionGenerator.update
      }.to change { Question.count }.by(3)
    end

    it "doesn't generate duplicate questions" do
      question = create(:question, answer: @movie1, others: [@movie2, @movie3])

      expect {
        QuestionGenerator.update
      }.not_to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
