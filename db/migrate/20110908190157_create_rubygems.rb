class CreateRubygems < ActiveRecord::Migration
  def change
    create_table :rubygems do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :rubygems, :user_id
  end
end
