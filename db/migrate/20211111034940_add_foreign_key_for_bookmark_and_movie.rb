class AddForeignKeyForBookmarkAndMovie < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :bookmark, foreign_key: true
  end
end
