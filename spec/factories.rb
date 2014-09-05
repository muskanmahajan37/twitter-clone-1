FactoryGirl.define do
  factory :user, class: User do
    name 'Harold Guthrey'
    email {"user_#{rand(1000).to_s}@factory.com" }
    password 'haroldiscool'
    password_confirmation 'haroldiscool'
  end
end
