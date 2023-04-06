class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :Shopping_information
end
