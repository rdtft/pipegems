class CreateRubygemVersions < ActiveRecord::Migration
  def change
    create_table :rubygem_versions do |t|
      t.references :rubygem
      t.string :version

      t.timestamps
    end
    add_index :rubygem_versions, :rubygem_id
  end
end
