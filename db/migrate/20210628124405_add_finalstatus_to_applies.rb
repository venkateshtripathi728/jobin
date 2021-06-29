class AddFinalstatusToApplies < ActiveRecord::Migration[6.0]
  def change
    add_column :applies, :finalstatus, :string, default: "pending"
  end
end
