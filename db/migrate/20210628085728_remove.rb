class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_reference :votes, :user, foreign_key: true
    drop_table :votes
  end

end
