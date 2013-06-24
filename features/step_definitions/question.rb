Given /^there are movies$/ do
  @movie1 = create(:movie, :title => "Kees de Jong0n")
  @movie2 = create(:movie, :title => "Batman")
  @movie3 = create(:movie, :title => "Driver")
end

Given /^there is a question$/ do
  step "there are movies"
  @question = create(:question, :answer => @movie1, :others => [@movie2, @movie3])
end

When /^I am on the homepage$/ do
  visit root_path
end

Then /^I should see no questions$/ do
  page.should have_content("no questions")
end

Then /^I should see a random question with (\d+) answers$/ do |number_of_answers|
  all('input[@name = "answer"]').size.should be(number_of_answers.to_i)
end

When /^I choose the correct answer$/ do
  step "I am on the homepage"
  choose("answer_#{@question.answer.id}")
  step "submit answer"
end

When /^submit answer$/ do
  click_button "Check"
end

Then /^I see that I have answered correctly$/ do
  page.should have_content("Hurray")
end

When /^I choose a wrong answer$/ do
  step "I am on the homepage"
  choose("answer_#{@question.others.sample.id}")
  step "submit answer"
end

Then /^I see that I have made a mistake$/ do
  page.should have_content("Awwwh")
end
