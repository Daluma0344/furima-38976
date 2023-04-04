class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :image

    validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_shop_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shopping_charge
  belongs_to :prefecture
  belongs_to :days_shop
end