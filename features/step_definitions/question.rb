Given /^there are movies$/ do
  @movie1 = create(:movie, :title => "Kees de Jong0n")
  @movie2 = create(:movie, :title => "Batman")
  @movie3 = create(:movie, :title => "Driver")
end

Given /^there is a question$/ do
  step "there are movies"
  @question = create(:question, :answer => @movie1, :others => [@movie2, @movie3])
end

Given /^I am on the homepage$/ do
  visit root_path
end

When /^I choose the correct answer$/ do
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
  choose("answer_#{@question.others.first.id}")
  step "submit answer"
end

Then /^I see that I have made a mistake$/ do
  page.should have_content("Awwwh")
end
