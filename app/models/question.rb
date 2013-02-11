class Question < ActiveRecord::Base
  # the question table has an answer_id
  belongs_to :answer, :class_name => "Movie", :foreign_key => :answer_id
  has_and_belongs_to_many :others, :class_name => "Movie", :join_table => :questions_others
  
  validates_presence_of :answer, :others

  attr_accessible :answer, :others
end
