class QuestionGenerator
  def self.update
    raise "Not enough movies in database" if Movie.count < 3

    Movie.all.each do |movie|
      if Question.where(answer: movie).size == 0
        question = Question.create(answer: movie)
        others = Movie.where("id != #{movie.id}").limit(2)
        question.others = others
        question.save!
      end
    end
  end
end
