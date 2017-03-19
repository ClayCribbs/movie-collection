class ProductionCompany < ApplicationRecord
	has_many :movie_production_company
	has_many :movies, through: :movie_production_company, source: :movie
end
