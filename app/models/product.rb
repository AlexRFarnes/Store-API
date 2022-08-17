class Product < ApplicationRecord
  acts_as_paranoid
  belongs_to :store
  validates :name, :price, :description, :store_id, presence: true
end
