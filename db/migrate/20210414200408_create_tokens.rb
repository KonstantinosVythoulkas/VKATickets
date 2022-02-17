class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens do |t|
      t.string :password_token
      t.datetime :password_time
      t.string :email_token
      t.datetime :email_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
