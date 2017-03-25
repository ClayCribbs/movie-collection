class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.references :movie, foreign_key: true, index: true
      t.references :user,  foreign_key: true, index: true

      t.timestamps
    end
  end
end
