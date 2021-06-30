class CreateNotificationApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_applies do |t|
      t.boolean :read
      t.string :description
      t.references :apply, null: false, foreign_key: true


      t.timestamps
    end
  end
end
