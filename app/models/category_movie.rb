class CategoryMovie < ApplicationRecord
  belongs_to :category
  belongs_to :movie
end
