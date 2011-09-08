class CreateGemFiles < ActiveRecord::Migration
  def change
    create_table :gem_files do |t|
      t.string :file
      t.references :rubygems_version

      t.timestamps
    end
    add_index :gem_files, :rubygems_version_id
  end
end
