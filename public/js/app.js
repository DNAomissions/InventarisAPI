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
				url: "/database/select/show_tables",
				success: function(result){
					this.tables = result
				} 
			});
		}
	}
});

new Vue({
	el: "#detail",
	data : {
		url : window.location.pathname.split("/"),
		id : '',
		json : this.json,
		api : window.location.protocol+"//"+window.location.host+"/api/",
		copy : ''
	},
	mounted: function(){
		this.showJSON();
	},
	ready: function(){
		this.showJSON();
	},
	methods: {
		showJSON: function(){
			if(this.id != ""){
				var uri = this.url[2]+"/"+this.id
				this.copy = this.api+this.url[2]+"/"+this.id
			}else{
				var uri = this.url[2]
				this.copy = this.api+this.url[2]+"/"
			}
			$.ajax({
				context: this,
				type: "GET",
				url: "/api/"+uri,
				success: function(result){
					if(this.url[2] == ""){
						this.json = JSON.stringify([{"message":"Please insert URL!"}])
					}else{
						this.json = JSON.stringify(result,null,'    ')
					}
				} 
			});
		},
		onCopy: function (e) {
	      	console.log('Berhasil mengcopy: ' + e.text)
	    },
	    onError: function (e) {
	      	alert('Failed to copy texts')
	    }
	}
});