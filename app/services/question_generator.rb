class QuestionGenerator
  def generate_questions
    if Movie.count < 3
      raise "Not enough movies in database"
    end
  end
end
