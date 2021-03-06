class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.integer    :budget
      t.string     :country
      t.string     :filming_locations
      t.integer    :gross
      t.string     :language
      t.string     :motion_picture_rated
      t.string     :official_site
      t.string     :poster
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
