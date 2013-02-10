class Movie < ActiveRecord::Base
  attr_accessible :imdb_link, :title

  has_many :screenshots

  validates_presence_of :title, :imdb_link
  validates :imdb_link, :format => URI::regexp(%w(http https)), :unless => :imdb_link_is_nil

  def imdb_link_is_nil
    imdb_link.blank?
  end
end
