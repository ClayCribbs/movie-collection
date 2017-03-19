require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_url
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_url, params: { movie: { awards: @movie.awards, budget: @movie.budget, cast_id: @movie.cast_id, country: @movie.country, director_id: @movie.director_id, filming_locations: @movie.filming_locations, gross: @movie.gross, language: @movie.language, motion_picture_rated: @movie.motion_picture_rated, official_site: @movie.official_site, photos: @movie.photos, production_company_id: @movie.production_company_id, rating: @movie.rating, release_date: @movie.release_date, runtime: @movie.runtime, storyline: @movie.storyline, title: @movie.title, videos: @movie.videos, vote_count: @movie.vote_count, writers_id: @movie.writers_id } }
    end

    assert_redirected_to movie_url(Movie.last)
  end

  test "should show movie" do
    get movie_url(@movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_url(@movie)
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { awards: @movie.awards, budget: @movie.budget, cast_id: @movie.cast_id, country: @movie.country, director_id: @movie.director_id, filming_locations: @movie.filming_locations, gross: @movie.gross, language: @movie.language, motion_picture_rated: @movie.motion_picture_rated, official_site: @movie.official_site, photos: @movie.photos, production_company_id: @movie.production_company_id, rating: @movie.rating, release_date: @movie.release_date, runtime: @movie.runtime, storyline: @movie.storyline, title: @movie.title, videos: @movie.videos, vote_count: @movie.vote_count, writers_id: @movie.writers_id } }
    assert_redirected_to movie_url(@movie)
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete movie_url(@movie)
    end

    assert_redirected_to movies_url
  end
end
