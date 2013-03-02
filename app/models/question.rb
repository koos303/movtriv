class Question < ActiveRecord::Base
  belongs_to :answer, :class_name => "Movie"
  has_and_belongs_to_many :others, :class_name => "Movie", :join_table => :questions_others

  validates_presence_of :answer, :others
  validates_uniqueness_of :answer_id

  def self.random
    offset(rand(count)).first
  end
end
