json.data do
	json.statistic do
		json.total_found @parse_result[:total_found].first[0]
		json.total_not_found @parse_result[:total_not_found].first[0]
	end
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