class CreateDirectors < ActiveRecord::Migration[5.0]
  def change
    create_table :directors do |t|
      t.datetime :birthday
      t.text     :description
      t.datetime :died
      t.string   :name
      t.string   :photos

      t.timestamps
    end
  end
end
