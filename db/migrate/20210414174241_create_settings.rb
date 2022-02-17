class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.boolean :two_factor, default: false
      t.boolean :email_comfirmed, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
