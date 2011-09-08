class CreateRubygemFiles < ActiveRecord::Migration
  def change
    create_table :rubygem_files do |t|
      t.string :file
      t.references :rubygem_version

      t.timestamps
    end
    add_index :rubygem_files, :rubygem_version_id
  end
end
