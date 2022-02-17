class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :user
      t.string :title
      t.string :assign
      t.string :statusinfo
      t.string :ticketDepartment
      t.boolean :status, default: :false
      t.boolean :readed, default: :false
      t.string :watchers, array: true, default: []

      t.timestamps
    end
  end
end
