class ChangeEndDateToDate < ActiveRecord::Migration[6.0]
  def change
    rename_column :interviews, :end_date, :date
  end
end
