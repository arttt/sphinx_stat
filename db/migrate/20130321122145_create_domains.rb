class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :domain_name
      t.string :sphinx_config_path
      t.integer :sphinx_config_file_indexing_period
      t.integer :sphinx_config_file_offset
      t.integer :weight

      t.timestamps
    end
  end
end
