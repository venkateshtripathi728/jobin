class Votesinit < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :count, :integer, default: 0
  end

end
