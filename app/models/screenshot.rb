class Screenshot < ActiveRecord::Base
  attr_accessible :file
  belongs_to :movie
end
