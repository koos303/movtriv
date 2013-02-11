require 'spec_helper'

describe Question do
  it { should belong_to(:answer) }
  it { should have_and_belong_to_many(:others) }

  it "has errors on the model" do
    question = Question.new
    question.save

    question.should have(1).error_on(:answer)
    question.should have(1).error_on(:others)
  end

  it "creates a valid question" do
    movie1 = create :movie
    movie2 = create :movie
    movie3 = create :movie

    Question.create(answer: movie1, others: [movie2, movie3])
    expect(Question.count).to eq 1
  end
end
