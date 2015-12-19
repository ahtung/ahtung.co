class ChangeProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :icon
    remove_column :projects, :color
    remove_column :projects, :content
    remove_attachment :projects, :image
  end
end
