class CastMember < ApplicationRecord
	has_many :cast_member_movie
	has_many :movies, through: :cast_member_movie, source: :movie
end
