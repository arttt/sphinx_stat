class Domain < ActiveRecord::Base
  attr_accessible :domain_name, :sphinx_config_file_indexing_period, :sphinx_config_file_offset, :sphinx_config_path, :weight
end
