class CreateNotificationInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_interviews do |t|
      t.boolean :read
      t.string :description
      t.references :interview, null: false, foreign_key: true

      t.timestamps
    end
  end
end
