class CastMembersController < ApplicationController
  def show
    @cast_member = CastMember.find(params[:id])
    @movie_array = @cast_member.movies

    query = Tmdb::Person.find(@cast_member.name)
    if query && query.first && query.first.known_for.length > 0
      query.first.known_for.each do |movie|
        unless movie.title.class.to_s == 'Hash'
          Movie.find_or_create_by(title: movie.title)
        end
      end
    end
  end
end
