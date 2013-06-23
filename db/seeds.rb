include ActionDispatch::TestProcess

if Movie.all.none?
  matrix_screenshot = FactoryGirl.create(:screenshot, file: FactoryGirl.fixture_file_upload("spec/fixtures/the_matrix.png", "image/png") )
  FactoryGirl.create(:movie, title: "The Matrix", screenshots: [matrix_screenshot])
  looper_screenshot = FactoryGirl.create(:screenshot, file: FactoryGirl.fixture_file_upload("spec/fixtures/looper.png", "image/png") )
  FactoryGirl.create(:movie, title: "Looper", screenshots: [looper_screenshot])
  django_screenshot = FactoryGirl.create(:screenshot, file: FactoryGirl.fixture_file_upload("spec/fixtures/django_unchained.png", "image/png") )
  FactoryGirl.create(:movie, title: "Django Unchained", screenshots: [django_screenshot])
  puts "Created 3 sample movies with screenshots"
end

if Admin.all.none?
  admin = FactoryGirl.create(:admin, :email => "admin@example.com", :password => "password1")
  puts "Created admin: #{admin.email}"
end
