class ChangeUserInFolder < ActiveRecord::Migration
  def change
    rename_column :folders, :user_id, :employee_id
  end
end
