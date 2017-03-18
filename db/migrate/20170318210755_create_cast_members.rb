class CreateCastMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :cast_members do |t|
      t.integer  :award_ids, index: true
      t.datetime :birthday
      t.text     :description
      t.datetime :died
      t.integer  :movie_ids, index: true
      t.string   :name
      t.string   :photos

      t.timestamps
    end
  end
end
