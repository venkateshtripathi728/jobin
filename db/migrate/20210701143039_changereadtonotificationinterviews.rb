class Changereadtonotificationinterviews < ActiveRecord::Migration[6.0]
  def change
        change_column :notification_interviews, :read, :boolean, default: "false"
  end
end
