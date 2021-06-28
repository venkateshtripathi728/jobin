class Reviewmodif < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :votes, :integer, default: 0
  end
end
