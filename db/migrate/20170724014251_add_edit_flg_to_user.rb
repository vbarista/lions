class AddEditFlgToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :edit_flg, :boolean
  end
end
