FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'田中'}
    second_name           {'二郎'}
    first_name_kana       {'tanaka'}
    second_name_kana      {'jiro'}
    birth_day             {'2000-01-01'}
  end
end