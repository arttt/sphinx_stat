class CreateSphinxLogLines < ActiveRecord::Migration
  def change
    create_table :sphinx_log_lines do |t|
      t.datetime :query_date
      t.string :match_mode
      t.float :query_time
      t.integer :filters_count
      t.string :sort_mode
      t.integer :total_matches
      t.string :offset
      t.string :limit
      t.string :groupby_attr
      t.string :index_name
      t.text :query_str
      t.integer :sphinx_id

      t.timestamps
    end
  end
end
