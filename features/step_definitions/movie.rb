When /^I make a new movie entry and upload a screenshot$/ do
  visit new_movie_path
  fill_in "Title", with: "Matrix, the"
  fill_in "Imdb link", with: "http://www.imdb.com/title/tt0133093/"
  attach_file("File", "#{Rails.root}/features/support/blank.png")
  click_button "Create Movie"
end

Then /^I will see the screenshot for that movie$/ do
  click_link "Matrix, the"
  page.should have_selector('img')
end
