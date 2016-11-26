class AddImageColumnsToProjects < ActiveRecord::Migration
  def up
    add_column :projects, :image_file_name, :string
    add_column :projects, :image_content_type, :string
    add_column :projects, :image_file_size, :integer
    add_column :projects, :image_updated_at, :datetime
  end

  def down
    remove_column :projects, :image_file_name, :string
    remove_column :projects, :image_content_type, :string
    remove_column :projects, :image_file_size, :integer
    remove_column :projects, :image_updated_at, :datetimer
  end
end
