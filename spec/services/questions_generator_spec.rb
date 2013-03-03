require 'spec_helper'

describe QuestionGenerator do
  before do
    @generator = QuestionGenerator.new
  end

  context "not enough movies in db" do
    it "raises an exception" do
      expect {
        @generator.generate_questions
      }.to raise_error("Not enough movies in database")
    end

    it "doesn't raise an exception do" do
      for i in (1..3) do
        create :movie, title: i
      end
      expect {
        @generator.generate_questions
      }.not_to raise_error("Not enough movies in database")
    end
  end
end
