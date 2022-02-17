class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :encrypted_password
      t.string :email
      t.string :mobile
      t.string :mobileCountryCode
      t.string :salt
      t.string :group, :default => "User"

      t.timestamps
    end
  end
end
