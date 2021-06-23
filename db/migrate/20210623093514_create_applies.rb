class CreateApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :applies do |t|
      t.string :job_title
      t.text :description
      t.string :status
      t.float :progression_bar
      t.string :location
      t.float :ranking
      t.string :url
      t.references :user, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
