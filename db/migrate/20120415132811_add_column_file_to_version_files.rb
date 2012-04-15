class AddColumnFileToVersionFiles < ActiveRecord::Migration
  def change
    add_column :version_files, :file, :string
  end
end