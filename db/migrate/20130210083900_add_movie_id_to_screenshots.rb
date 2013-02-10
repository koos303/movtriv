class AddMovieIdToScreenshots < ActiveRecord::Migration
  def change
    add_column :screenshots, :movie_id, :integer
  end
end
