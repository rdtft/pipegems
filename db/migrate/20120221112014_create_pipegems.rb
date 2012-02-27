class CreatePipegems < ActiveRecord::Migration
  def change
    create_table :pipegems do |t|
      t.string :name
    end
  end
end
