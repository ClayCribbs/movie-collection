class CreateCastMemberMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :cast_member_movies do |t|
      t.references :cast_member, foreign_key: true
      t.references :movie,       foreign_key: true

      t.timestamps
    end
  end
end
