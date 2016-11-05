class ChangeProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :icon
    remove_column :projects, :color
    remove_column :projects, :content
    remove_column :projects, :image_file_name, :string
    remove_column :projects, :image_content_type, :string
    remove_column :projects, :image_file_size, :integer
    remove_column :projects, :image_updated_at, :datetime
  end
end
