class CreateSphinxes < ActiveRecord::Migration
  def change
    create_table :sphinxes do |t|
      t.string :name
      t.string :log_file_path
      t.integer :weight

      t.timestamps
    end
  end
end
