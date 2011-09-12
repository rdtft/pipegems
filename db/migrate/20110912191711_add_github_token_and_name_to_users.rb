class AddGithubTokenAndNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github_token, :string
    add_column :users, :name, :string
  end
end
