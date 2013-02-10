class Movie < ActiveRecord::Base
  attr_accessible :imdb_link, :title
  has_many :screenshots
  validates_presence_of :title, :imdb_link
end
