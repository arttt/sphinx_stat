function SphinxParserViewModel(sphinxes){
  var self = this;
  self.sphinxes = sphinxes;
  self.sort_limits = [100,200,500,1000];
  self.current_sort_limit = ko.observable(self.sort_limits[0]);
  self.selected_sphinxes = ko.observableArray();
  self.selected_sphinx = ko.observable(self.sphinxes[0]);
  self.search_result_found = ko.observableArray();
  self.search_result_not_found = ko.observableArray();

  self.date_from = ko.observable();
  self.date_to = ko.observable();
  self.current_state_template = ko.observable();

  self.validate = function(){
  	return self.date_from() && self.date_to();
  };

  self.search = function(){
   if (self.current_state_template() == 'loading_template')
    return;

  self.search_result_found([]);
  if(!self.validate())return;
  	self.current_state_template('loading_template');
	var data_to_send = {
		sphinx_id: self.selected_sphinx().id,
		date_from: self.date_from(),
		date_to: self.date_to(),
		sort_limit: self.current_sort_limit()
	};
//	console.log(data_to_send);
	$.post("/search", data_to_send, function(returnedData) {
		console.log(returnedData);
	  self.current_state_template('data_template');
		self.search_result_not_found(returnedData.data.not_found_data);
		self.search_result_found(returnedData.data.found_data);
	});
  }

  self.clear_selection = function(){
  	self.selected_sphinxes([]);
  }
  
  self.select_all = function(){
    $.each(self.sphinxes, function(index, value) {
		self.selected_sphinxes.push(""+value.id+"");
	});
  }
};