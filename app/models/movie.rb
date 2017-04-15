class Movie < ApplicationRecord
  has_many :cast_member_movie
  has_many :cast_members, through: :cast_member_movie, source: :cast_member

  has_many :category_movie
  has_many :categories, through: :category_movie, source: :category

  has_many :director_movie
  has_many :directors, through: :director_movie, source: :director

  has_many :movie_production_company
  has_many :production_companies, through: :movie_production_company, source: :production_company

  has_many :movie_writer
  has_many :writers, through: :movie_writer, source: :writer

  has_many :collection_movie
  has_many :collections, through: :collection_movie, source: :collection

  mount_uploaders :photos, PhotoUploader
  serialize :photos

  validates :title, uniqueness: true

  scope :contains, -> (query) { where("storyline ilike ? OR title ilike ?", "%#{query}%", "%#{query}%")}

  before_save :ensure_movie_attributes

  def ensure_movie_attributes
    @omdb_movie = OMDB.title(title)
    if @omdb_movie.response.to_s == 'True' && @omdb_movie.poster.length > 10 && Movie.find_by_title(@omdb_movie.title).nil?
      self.title        = @omdb_movie.title
      self.runtime      = @omdb_movie.runtime
      self.rating       = @omdb_movie.imdb_rating
      self.vote_count   = @omdb_movie.imdb_votes
      self.poster       = @omdb_movie.poster
      self.storyline    = @omdb_movie.plot
      self.language     = @omdb_movie.language
      self.motion_picture_rated = @omdb_movie.rated
      self.country      = @omdb_movie.country
      self.title        = @omdb_movie.title
      self.release_date = ("1/1/#{@omdb_movie.year}").to_date
      self.directors    << Director.find_or_create_by(name: @omdb_movie.director)
      self.writers      << Writer.find_or_create_by(name: @omdb_movie.writer)
      self.categories   << Category.find_or_create_by(name: @omdb_movie.genre)
      @omdb_movie.actors.split(', ').each do |actor|
        self.cast_members << CastMember.find_or_create_by(name: actor)
      end
    else
      throw :abort
    end
  end
end
