class Sphinx < ActiveRecord::Base
  attr_accessible :log_file_path, :name, :weight
end
