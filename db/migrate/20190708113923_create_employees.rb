class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.datetime :joined_at
      t.float :salary
      t.timestamps
    end
  end
end
