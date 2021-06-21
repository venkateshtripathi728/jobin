class CreateContactApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_applications do |t|
      t.references :contact, null: false, foreign_key: true
      t.references :application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
