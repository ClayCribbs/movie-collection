class CreateDirectorMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :director_movies do |t|
      t.references :director, foreign_key: true
      t.references :movie,    foreign_key: true

      t.timestamps
    end
  end
end
