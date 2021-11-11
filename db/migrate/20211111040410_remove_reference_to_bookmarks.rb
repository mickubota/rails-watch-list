class RemoveReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    remove_reference :movies, :bookmark, foreign_key: true, index: false
    add_reference :bookmarks, :movies, foreign_key: true
  end
end
