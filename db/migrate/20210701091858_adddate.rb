class Adddate < ActiveRecord::Migration[6.0]
  def change
    change_column :applies, :updatedate, :date, :default => Date.today()
  end
end
