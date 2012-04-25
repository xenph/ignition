class AddEventsTable < ActiveRecord::Migration
  def change
    create_table :events, :force => true do |t|
      t.integer :user_id, :null => false
      t.integer :project_id, :null => false
      t.string :description
      t.timestamps
    end
  end
end