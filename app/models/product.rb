class Product < ApplicationRecord
  belongs_to :store
  validates :name, :price, :description, :store_id, presence: true
end
