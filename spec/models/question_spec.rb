require 'spec_helper'

describe Question do
  it { should belong_to(:answer) }
  it { should have_and_belong_to_many(:others) }
  it { should have_db_index(:answer_id) }

  it "has validation" do
    question = Question.new
    question.save

    question.should have(1).error_on(:answer)
    question.should have(1).error_on(:others)
  end

  context "creating a question" do
    before(:each) do
      @movie1 = create :movie
      @movie2 = create :movie
      @movie3 = create :movie
    end

    it "creates valid questions" do
      question1 = create(:question, answer: @movie1, others: [@movie2, @movie3])
      question1.should be_valid
    end

    it "prevents duplicate answers" do
      question1 = create(:question, :answer => @movie1, others: [@movie2, @movie3])
      question2 = build(:question, :answer => @movie1, others: [@movie2, @movie3])

      question2.should_not have_valid(:answer_id)
    end
  end
end
