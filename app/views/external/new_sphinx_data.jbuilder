json.data do
	json.not_found_data do
		json.array! @parse_result[:not_found] do |res|
			json.query_str res[0]
			json.count res[1]
		end
	end
	json.found_data do 
		json.array! @parse_result[:found] do |res|
			json.query_str res[0]
			json.count res[1]
			json.total_matches res[2].to_i
		end
	end
end