class AddCounterCacheToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :reviews_count, :string
    add_column :rooms, :integer, :string
  end
end
