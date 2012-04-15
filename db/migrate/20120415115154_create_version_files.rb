class CreateVersionFiles < ActiveRecord::Migration
  def change
    create_table :version_files do |t|
      t.references :version
      t.timestamps
    end
  end
end
