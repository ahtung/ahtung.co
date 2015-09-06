class AddImageColumnsToProjects < ActiveRecord::Migration
  def up
    add_attachment :projects, :image
  end

  def down
    remove_attachment :projects, :image
  end
end
