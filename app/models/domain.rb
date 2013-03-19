class Domain < ActiveRecord::Base
validates_presence_of  :sphinx_config_path ,:if => lambda{|f| FileTest.exists?(f.sphinx_config_path) }
validates_presence_of  :domain_name
  attr_accessible :domain_name, :sphinx_config_file_indexing_period, :sphinx_config_file_offset, :sphinx_config_path, :weight
end
