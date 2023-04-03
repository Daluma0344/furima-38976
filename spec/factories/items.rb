FactoryBot.define do
  factory :item do
    association :user

    item_name           {'商品名'}
    item_description    {Faker::Lorem.sentence}
    item_category_id    {2}
    item_condition_id   {2}
    shopping_charge_id  {2}
    prefecture_id       {2}
    days_shop_id        {2}
    item_price          {2222}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end