class AddPublishedToRubygemVersion < ActiveRecord::Migration
  def change
    add_column :rubygem_versions, :published, :boolean

  end
end
