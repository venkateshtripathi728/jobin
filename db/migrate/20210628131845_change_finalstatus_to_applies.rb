class ChangeFinalstatusToApplies < ActiveRecord::Migration[6.0]
  def change
    change_column :applies, :finalstatus, :string, default: "Pending"

  end
end
