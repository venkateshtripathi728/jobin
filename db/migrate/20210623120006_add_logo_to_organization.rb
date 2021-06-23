class AddLogoToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :logo, :string
  end
end
