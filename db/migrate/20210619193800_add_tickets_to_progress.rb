class AddTicketsToProgress < ActiveRecord::Migration[6.1]
  def change
    add_reference :progresses, :ticket, null: false, foreign_key: true
  end
end
