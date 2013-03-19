require 'sphinx_log_parser'
class MainController < ApplicationController
	def index
	end

	def search
		d1 = DateTime.strptime("#{params[:date_from]}-00-00-00","%Y-%m-%d-%H-%M-%S")
		d2 = DateTime.strptime("#{params[:date_to]}-23-59-59","%Y-%m-%d-%H-%M-%S")
				
		parser = SphinxLogParser.new
		@parse_result = parser.new_search(d1,d2,Sphinx.find(params[:sphinx_id]),params[:sort_limit])
		render 'external/new_sphinx_data'
	end

end
