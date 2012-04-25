class ChangeCommentsToEvents < ActiveRecord::Migration
  def change
    rename_column :comments, :project_id, :event_id
  end
end