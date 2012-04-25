class AddCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments, :force => true do |t|
      t.integer :user_id, :null => false
      t.integer :project_id, :null => false
      t.text :comment
      t.timestamps
    end
  end
end