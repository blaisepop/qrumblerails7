class CreateDynamicRedirections < ActiveRecord::Migration[7.0]
  def change
    create_table :dynamic_redirections do |t|
      t.string :key_value
      t.string :destination
      t.string :type
      t.integer :scan_count

      t.timestamps
    end
  end
end
