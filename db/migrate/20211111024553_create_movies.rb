class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.integer :rating
      t.string :poster_url

      t.timestamps
    end
  end
end
