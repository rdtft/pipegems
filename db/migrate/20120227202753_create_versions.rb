class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.references :pipegem
      t.string     :name
      t.boolean    :published, :default => false
      t.timestamps
    end
  end
end
