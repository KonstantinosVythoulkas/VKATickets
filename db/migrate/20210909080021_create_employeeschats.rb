class CreateEmployeeschats < ActiveRecord::Migration[6.1]
  def change
    create_table :employeeschats do |t|
      t.string :username, array: true, default: []
      t.string :employeeGroup, array: true, default: []
      t.datetime :sendtime, array: true, default: []
      t.string :content, array: true, default: []


      t.timestamps
    end
  end
end
