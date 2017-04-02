class CreateCollectionMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :collection_movies do |t|
      t.references :collection, foreign_key: true, index: true
      t.references :movie,      foreign_key: true, index: true

      t.timestamps
    end
  end
end
