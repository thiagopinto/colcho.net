class RemoveOldPasswordFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :password, :string
  end
end