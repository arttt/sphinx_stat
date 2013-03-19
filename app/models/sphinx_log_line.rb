class SphinxLogLine < ActiveRecord::Base
  attr_accessible :filters_count, :groupby_attr, :index_name, :limit, :match_mode, :offset, :query_date, :query_str, :query_time, :sort_mode, :sphinx_id, :total_matches
end
