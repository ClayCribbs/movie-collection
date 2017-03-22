class Movie < ApplicationRecord
  has_many :cast_member_movie
  has_many :cast_members, through: :cast_member_movie, source: :cast_member

  has_many :category_movie
  has_many :categories, through: :category_movie, source: :category

  has_many :director_movie
  has_many :directors, through: :director_movie, source: :director

  has_many :movie_production_company
  has_many :production_companies, through: :movie_production_company, source: :production_company

  has_many :users

  has_many :movie_writer
  has_many :writers, through: :movie_writer, source: :writer

  mount_uploaders :photos, PhotoUploader
  serialize :photos
end
