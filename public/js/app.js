var endpoint = new Vue({
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
				url: "/api/database/show/tables",
				success: function(result){
					this.tables = result
				} 
			});
		}
	}
});

var detail = new Vue({
	el: "#detail",
	data : {
		url : window.location.pathname.split("/"),
		id : '',
		json : this.json,
		api : window.location.protocol+"//"+window.location.host+"/api/",
		copy : '',
		table : '',
		menu: 'CREATE',
		col: this.col
	},
	mounted: function(){
		this.showJSON();
	},
	ready: function(){
		this.showJSON();
	},
	methods: {
		showJSON: function(){
			this.table = this.url[2]
			switch(this.menu){
				case 'CREATE':
					this.copy = this.api+this.table+"/"
					$.ajax({
						context: this,
						type: "GET",
						url: "/api/database/show/"+this.table+"/column",
						success: function(result){
							if(this.url[2] == ""){
								this.json = JSON.stringify({"message":"Please insert URL!"},null,'    ')
								this.column = {"message":"Please insert URL!"}
							}else{
								this.json = JSON.stringify(result,null,'    ')
								this.col = result
							}
						} 
					});
					break;
				case 'READ':
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
								this.json = JSON.stringify({"message":"Please insert URL!"},null,'    ')
							}else{
								this.json = JSON.stringify(result,null,'    ')
							}
						} 
					});
					break;
				case 'UPDATE':
					if(this.id != ""){
						$.ajax({
							context: this,
							type: "GET",
							url: "/api/"+this.table+"/"+this.id+"/",
							success: function(result){
								this.json = JSON.stringify(result,null,'    ')
							}
						});
					}else{
						this.json = JSON.stringify({"message":"Please insert ID!"},null,'    ')
					}
					break;
				case 'DELETE':
					if(this.id != ""){
						$.ajax({
							context: this,
							type: "GET",
							url: "/api/"+this.table+"/"+this.id+"/",
							success: function(result){
								this.json = JSON.stringify(result,null,'    ')
							}
						});
					}else{
						this.json = JSON.stringify({"message":"Please insert ID!"},null,'    ')
					}
					break;
				default:
					this.json = JSON.stringify({"error":"Undefined Method"})
					break;
			}
		},
		onCopy: function (e) {
	      	console.log('Berhasil mengcopy: ' + e.text)
	    },
	    onError: function (e) {
	      	alert('Failed to copy texts')
	    }
	}
});

var header = new Vue({
	el: '#header',
	data: {
		table : ''
	},
	mounted: function(){
		this.setTable()
	},
	ready: function(){
		this.setTable()
	},
	methods: {
		setTable: function(){
			this.table = detail.table
		},
		setMenu: function(menu){
			detail.menu = menu
			detail.showJSON()
		}
	}
});