class AddWatches < ActiveRecord::Migration
  def change
    create_table :watches, :force => true do |t|
      t.integer :user_id
      t.integer :project_id      
      t.timestamps
    end
  end
end