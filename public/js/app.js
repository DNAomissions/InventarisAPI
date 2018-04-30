new Vue({
	el : "#endpoint",
	data : {
		tables : this.tables
	},
	mounted: function(){
		this.showTables();
	},
	ready: function(){
		this.showTables();
	},
	methods: {
		showTables: function(){
			$.ajax({
				context: this,
				type: "GET",
				url: "/show_tables",
				success: function(result){
					this.tables = result;
				} 
			});
		}
	}
});