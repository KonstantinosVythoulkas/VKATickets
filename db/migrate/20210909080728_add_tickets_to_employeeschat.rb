class AddTicketsToEmployeeschat < ActiveRecord::Migration[6.1]
  def change
    add_reference :employeeschats, :ticket, null: false, foreign_key: true
  end
end
