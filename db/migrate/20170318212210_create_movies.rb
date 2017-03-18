class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.references :cast_members,       foreign_key: true
      t.references :categories,         foreign_key: true
      t.references :directors,          foreign_key: true
      t.references :production_company, foreign_key: true
      t.references :writers,            foreign_key: true
      t.integer    :awards,          foreign_key: true
      t.integer    :budget
      t.string     :country
      t.string     :filming_locations
      t.integer    :gross
      t.string     :language
      t.string     :motion_picture_rated
      t.string     :official_site
      t.string     :photos
      t.decimal    :rating
      t.datetime   :release_date
      t.integer    :runtime
      t.text       :storyline
      t.string     :title
      t.string     :videos
      t.integer    :vote_count

      t.timestamps
    end
  end
end
