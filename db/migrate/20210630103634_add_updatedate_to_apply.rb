class AddUpdatedateToApply < ActiveRecord::Migration[6.0]
  def change
    add_column :applies, :updatedate, :date
  end
end
