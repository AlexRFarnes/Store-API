FactoryBot.define do
  factory :user do
    email { "alexrfarnes@mystring.com" }
    age { 18 }
    password_digest { "MyString" }
    type { "test" }
  end
end
