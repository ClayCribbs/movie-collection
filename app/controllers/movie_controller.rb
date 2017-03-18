class MovieController < ApplicationController
 before_action :set_movie, only: [:show, :edit, :update]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movies_path, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movies_path, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def code_school_params
    params.require(:movie).permit(  :cast_members_id,
                                    :categories_id,
                                    :directors_id,
                                    :production_company_id,
                                    :writers_id,
                                    :awards,
                                    :budget,
                                    :country,
                                    :filming_locations,
                                    :gross,
                                    :language,
                                    :motion_picture_rated,
                                    :official_site,
                                    :photos,
                                    :rating,
                                    :release_date,
                                    :runtime,
                                    :storyline,
                                    :title,
                                    :videos,
                                    :vote_count,
                                  )
  end
end
