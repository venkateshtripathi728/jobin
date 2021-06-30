class ChangeReadToNotificationapplies < ActiveRecord::Migration[6.0]
  def change
    change_column :notification_applies, :read, :boolean, default: "false"
  end
end
