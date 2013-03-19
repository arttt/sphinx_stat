function SphinxParserViewModel(domains){
  var self = this;
  self.domains = domains;
  self.selected_domains = ko.observableArray();
  self.search_result = ko.observableArray();

  self.date_from = ko.observable();
  self.date_to = ko.observable();
  self.current_state_template = ko.observable();

  self.validate = function(){
  	return ( self.selected_domains().length > 0 ) && self.date_from() && self.date_to();
  };

  self.search = function(){
  //	if(!self.validate())return;
  self.search_result([]);
  	self.current_state_template('loading_template');
	var data_to_send = {
		domains: self.selected_domains(),
		date_from: self.date_from(),
		date_to: self.date_to()
	};
	console.log(data_to_send);
	$.post("/search", data_to_send, function(returnedData) {
		console.log(returnedData);
	  	self.current_state_template('data_template');
		self.search_result(returnedData.data);
	});
  }

  self.clear_selection = function(){
  	self.selected_domains([]);
  }
  
  self.select_all = function(){
    $.each(self.domains, function(index, value) {
		self.selected_domains.push(""+value.id+"");
	});
  }
};