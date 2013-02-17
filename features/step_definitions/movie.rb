Given /^I am a logged in admin$/ do
  step "I go to the admin login page"
  step "I enter valid credentials"
end

Given /^there is a admin user$/ do
  @admin = create(:admin, :email => 'leet@admin.com', :password => 'poepjes+scheetjes')
end

When /^I go to the admin login page$/ do
  visit new_admin_session_path
end

When /^I enter valid credentials$/ do
  step "there is a admin user"
  fill_in "Email", with: "leet@admin.com"
  fill_in "Password", with: "poepjes+scheetjes"
  click_button "Sign in"
end

When /^I make a new movie entry and upload a screenshot$/ do
  visit new_movie_path
  fill_in "Title", with: "Matrix, the"
  fill_in "Imdb link", with: "http://www.imdb.com/title/tt0133093/"
  click_link "add screenshot"
  attach_file("File", "#{Rails.root}/features/support/blank.png")
  click_button "Create Movie"
end

Then /^I will see the screenshot for that movie$/ do
  click_link "Matrix, the"
  page.should have_selector('img')
end
