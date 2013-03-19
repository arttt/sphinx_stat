require 'sphinx_cfg_parser'
class MainController < ApplicationController
	def index
	end

	def search
		d1 = Date.new(2013,03,19)
		d2 = Date.new(2013,03,20)
		parser = SphinxCfgParser.new
		log_files = ["/home/a/ruby_test/query.log"]
		@parse_result = parser.process(d1,d2,log_files)[0..100]
		
		render 'external/sphinx_data'
	end

end
