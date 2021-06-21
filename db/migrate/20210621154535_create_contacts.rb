class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :linkedin_url
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
