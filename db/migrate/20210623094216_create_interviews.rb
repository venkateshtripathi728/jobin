class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.date :start_date
      t.date :end_date
      t.string :step
      t.text :notes
      t.references :apply, null: false, foreign_key: true

      t.timestamps
    end
  end
end
