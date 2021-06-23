class AddReferenceInterviewtoReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :interview, foreign_key: true
  end
end
