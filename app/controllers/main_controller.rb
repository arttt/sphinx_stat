require 'sphinx_cfg_parser'
class MainController < ApplicationController
	def index
	end

	def search
		#"date_from"=>"03/13/2013", "date_to"=>"03/20/2013"
		d1 = DateTime.strptime("#{params[:date_from]}-00-00-00","%Y-%m-%d-%H-%M-%S")
		d2 = DateTime.strptime("#{params[:date_to]}-23-59-59","%Y-%m-%d-%H-%M-%S")
		parser = SphinxCfgParser.new
		log_files = Domain.find(params[:domains]).collect{|obj| obj.sphinx_config_path}
		@parse_result = parser.process(d1,d2,log_files)[0..200]
		
		render 'external/sphinx_data'
	end

end
