class QuestionOther < ActiveRecord::Base
  belongs_to :question, :foreign_key => "question_id"
  has_one :movie, :class_name => "Movie", :foreign_key => "movie_id"

  validates_presence_of :question, :movie
end

