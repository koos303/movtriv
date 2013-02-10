FactoryGirl.define do
  factory :screenshot do
    file File.open("#{Rails.root}/features/support/blank.png")
  end
end
