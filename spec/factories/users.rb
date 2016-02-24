FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      "MyUsername#{n}"
    end
	password "MyString"
	password_confirmation "MyString"
  end

end
