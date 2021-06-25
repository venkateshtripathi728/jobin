class RemoveStartDateFromInterview < ActiveRecord::Migration[6.0]
  def change
    remove_column :interviews, :start_date, :date
  end
end
