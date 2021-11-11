class ChangeRatingToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :rating, :float
  end
end
