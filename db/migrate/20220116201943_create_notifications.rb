class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :info
      t.integer :infoticketid
      t.boolean :status, default: :false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
