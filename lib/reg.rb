#http://trentrichardson.com/examples/timepicker/
#http://ru.wikipedia.org/wiki/%D0%A0%D0%B5%D0%B3%D1%83%D0%BB%D1%8F%D1%80%D0%BD%D1%8B%D0%B5_%D0%B2%D1%8B%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F
#http://sphinxsearch.com/docs/1.10/query-log-format.html
require 'time'
#str = "[Wed Mar 20 12:55:26 2013] 0.000 sec [ext/0/rel 0 (0,1000) @groupby-attr] [tube_ind] pointy hello"
#        0   1   2  3  4  5  6      7    8    9 10 11  12 13  14     15               16          17
reg = /^\[(\D+)\s(\D+)\s(\d+)\s(\d+):(\d+):(\S+)\s(\d+)\]\s(\S+)\s(\D+)\s\[(\D+)\/(\S+)\/(\S+)\s(\d+)\s\((\S+),(\S+)\)\s*(\S*)\]\s\[(\S+)\]\s(.*)$/i
#           0      1      2      3     4     5      6        7     8        9      10      11     12      13   14          15        16       17
d1 = Date.new(2013,03,19)
d2 = Date.new(2013,03,20)

parsed_data = []
begin
    file = File.new("query.log", "r")
    while (line = file.gets)
  #	p line
	line = line.encode('UTF-8', 'UTF-8')
	res = reg.match(line).captures

	###########################################
	query_obj = {
	    query_date: DateTime.strptime("#{res[0]}#{res[1]}#{res[2]}#{res[3]}#{res[4]}#{res[5][0..1]}#{res[6]}", '%a%b%d%H%M%S%Y'),
	    match_mode: res[9],
	    query_time: res[7].to_f,
	    filters_count: res[10],
	    sort_mode: res[11],
	    total_matches: res[12],
	    offset: res[13],
	    limit: res[14],
	    groupby_attr: res[15],
	    index_name: res[16],
	    query_str: res[17]
	}
	#########################################
	parsed_data << query_obj if (query_obj[:query_date].to_date >= d1 && query_obj[:query_date].to_date <= d2)
    end
    file.close
rescue => err
    puts "Exception: #{err}"
    err
end
##################
class LineStatistic
    include Comparable
    attr_reader :counter
    
    def initialize()
	@counter = 0
	@index_stat = Hash.new
    end
    
    def increment(db_index)
	if @index_stat.has_key?(db_index)
	    @index_stat[db_index] += 1
	else
	    @index_stat[db_index] = 1
	end
	@counter += 1
    end

    def <=> (other) 
	self.counter <=> other.counter
    end
end
############################################
p "All found: #{parsed_data.count}"
#p s_index = parsed_data.index { |obj| obj[:query_date].to_date == d1 }
#p e_index = parsed_data.rindex { |obj| obj[:query_date].to_date == d2 }

result_data = {}

parsed_data.each do |obj|
    encoded_key = obj[:query_str].encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: 'bad_sequence').downcase
    
    if result_data[encoded_key]
	result_data[encoded_key].increment(obj[:index_name])
    else
	result_data[encoded_key] = LineStatistic.new
	result_data[encoded_key].increment(obj[:index_name])
    end
end

result_data.sort_by {|_key, value| value}.reverse[0..10].each do |k,v|
	p '----------------------------------'
	p k
	p v
	p '----------------------------------'
end



