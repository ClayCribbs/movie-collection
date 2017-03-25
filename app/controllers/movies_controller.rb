class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: [:show, :edit, :update, :get_movie_attributes]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all.order(rating: :desc)
    @movie  = Movie.find(params[:selected_movie]) if params[:selected_movie]
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movies = Movie.all.order(rating: :desc)
  end

  # GET /movies/new
  def new
    if params[:query].present?
      gon.query = params[:query]
    end
    @movie = Movie.new
    @results = OMDB.search(params[:search_title]) if params[:search_title]
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)
    get_movie_attributes(@movie)
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def get_movie_attributes(movie)
      title = movie.title
      @omdb_movie = OMDB.title(title)
      if @omdb_movie.response.to_s == 'True' && @omdb_movie.poster.length > 10
        movie.runtime      = @omdb_movie.runtime
        movie.rating       = @omdb_movie.imdb_rating
        movie.vote_count   = @omdb_movie.imdb_votes
        movie.poster       = @omdb_movie.poster
        movie.storyline    = @omdb_movie.plot
        movie.save
        redirect_to movies_path, notice: 'Movie was successfully created.' 
      else
        movie.delete
        redirect_to new_movie_path(search_title: title), errors: 'Could not be created'
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :release_date, :rating, :vote_count, :runtime, :motion_picture_rated, :storyline, :official_site, :country, :language, :filming_locations, :budget, :gross, :poster, videos: [], production_company_ids: [], director_ids: [], cast_member_ids: [], writer_ids: [])
    end
end
