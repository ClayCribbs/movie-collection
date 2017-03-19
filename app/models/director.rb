class Director < ApplicationRecord
	has_many :director_movie
	has_many :movies, through: :director_movie, source: :movie
end
