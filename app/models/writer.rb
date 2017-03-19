class Writer < ApplicationRecord
	has_many :movie_writer
	has_many :movies, through: :movie_writer, source: :movie
end
