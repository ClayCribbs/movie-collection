class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_movie
  has_many :movies, through: :collection_movie, source: :movie
end
