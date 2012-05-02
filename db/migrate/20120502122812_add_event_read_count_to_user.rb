class AddEventReadCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :event_read_count, :integer, :default => 0
  end
end