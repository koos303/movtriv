class Screenshot < ActiveRecord::Base
  belongs_to :movie

  mount_uploader :file, FileUploader
end
