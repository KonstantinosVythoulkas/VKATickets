class CreateProgresses < ActiveRecord::Migration[6.1]
  def change
    create_table :progresses do |t|
      t.string :username
      t.string :department
      t.string :subusername,  array: true, default: []
      t.string :subdepartment,  array: true, default: []
      t.boolean :status,  array: true, default: []
      t.string :statusDesc,  array: true, default: []
      t.string :info, array: true, default: []

      t.timestamps
    end
  end
end
