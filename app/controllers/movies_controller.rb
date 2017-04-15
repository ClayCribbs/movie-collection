class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: [:show, :edit, :update, :get_movie_attributes, :manage_collection]
  # GET /movies
  # GET /movies.json
  def index
    if params[:collection_sort]
      @movies = Collection.find(params[:collection_sort]).movies
    else
      @movies = Movie.all.order(rating: :desc)
    end
    if params[:q].present?
      @q = params[:q]
      if @movies.contains(@q).present?
        @movies = @movies.contains(@q) 
      else
        @results = OMDB.search(@q)
        @movies = @movies.contains(@q)
      end
    end
    
    @collections = Collection.where(user_id: current_user.id)
    @collection = Collection.new(user_id: current_user.id)
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

  def manage_collection
    @collection = Collection.find(params[:collection])
    type = params[:type]
    if type == "Add"
      @collection.movies << @movie
      redirect_to :back, notice: "You added #{@movie.title} to #{@collection.name}"

    elsif type == "Remove"
      @collection.movies.delete(@movie)
      redirect_to :back, notice: "Removed #{@movie.title} from #{@collection.name}"

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)
    unless @movie.destroyed?
      if @movie.save
        redirect_to root_url
      else
        redirect_to root_url
      end
    end
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

    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :release_date, :rating, :vote_count, :runtime, :motion_picture_rated, :storyline, :official_site, :country, :language, :filming_locations, :budget, :gross, :poster, videos: [], production_company_ids: [], director_ids: [], cast_member_ids: [], writer_ids: [] )
    end
end
