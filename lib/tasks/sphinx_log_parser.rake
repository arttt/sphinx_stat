require 'sphinx_log_parser'

namespace :sphix_log_parser do
	
  task :process => :environment do

  	parser = SphinxLogParser.new
	Sphinx.all.each do |sphinx|
		parser.process(sphinx)
	end

  end

end