class UpdateColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :appointments, :descrption, :description
    add_column :appointments, :status, :string
  end
end
