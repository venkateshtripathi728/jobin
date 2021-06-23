class CreateContactApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_applies do |t|
      t.references :contact, null: false, foreign_key: true
      t.references :apply, null: false, foreign_key: true

      t.timestamps
    end
  end
end
