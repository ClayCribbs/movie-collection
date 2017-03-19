class CreateMovieProductionCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_production_companies do |t|
      t.references :movie,              foreign_key: true
      t.references :production_company, foreign_key: true

      t.timestamps
    end
  end
end
