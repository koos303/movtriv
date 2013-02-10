class Movie < ActiveRecord::Base
  has_many :screenshots

  attr_accessible :imdb_link, :title, :screenshots_attributes
  accepts_nested_attributes_for :screenshots, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :title, :imdb_link
  validates :imdb_link, :format => URI::regexp(%w(http https)), :unless => :imdb_link_is_nil

  def imdb_link_is_nil
    imdb_link.blank?
  end
end
