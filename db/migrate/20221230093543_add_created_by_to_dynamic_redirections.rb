class AddCreatedByToDynamicRedirections < ActiveRecord::Migration[7.0]
  def change
    add_column :dynamic_redirections, :created_by, :integer
  end
end
