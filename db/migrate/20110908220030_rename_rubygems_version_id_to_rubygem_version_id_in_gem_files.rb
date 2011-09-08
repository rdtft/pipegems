class RenameRubygemsVersionIdToRubygemVersionIdInGemFiles < ActiveRecord::Migration
  def up
    rename_column :gem_files, :rubygems_version_id, :rubygem_version_id
  end

  def down
    rename_column :gem_files, :rubygem_version_id, :rubygems_version_id
  end
end
