class FillEmptyImages < ActiveRecord::Migration
  def up
    Project.all.each do |project|
      if !project.image_url
        project.assign_random_image
        project.save
      end
    end
  end
  
  def down
    raise ActiveRecord::IrreversibleMigration, "y u rollback?"
  end
end
