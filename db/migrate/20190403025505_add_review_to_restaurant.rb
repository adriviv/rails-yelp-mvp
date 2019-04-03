class AddReviewToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :reviews, :string
  end
end
