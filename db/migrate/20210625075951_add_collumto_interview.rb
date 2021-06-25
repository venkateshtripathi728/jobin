class AddCollumtoInterview < ActiveRecord::Migration[6.0]
  def change
    add_column :interviews, :start_time, :time
    add_column :interviews, :end_time, :time
  end
end
