@extends('app.app')

@section('content')
<br>
	<div class="container" id="detail">
		<div class="col-md-10 offset-md-1">
			<h2 class="text-center"><strong>{{strtoupper($table)}}</strong></h2>
			<h6 class="text-center">@{{menu}}</h6>
			<div v-if="menu == 'CREATE'">
				<div class="card">
				  	<div class="card-header">
				  		<div class="container-fluid">
					  		<div class="row">
					  			<input type="text" class="form-control col-md-7" v-bind:value="'POST | {{url()}}/api/{{$table}}/'" readonly>&nbsp;
					  			<button v-clipboard:copy="copy" class="col-md-2 btn btn-primary" v-clipboard:success="onCopy" v-clipboard:error="onError" alt="Copy!">Copy&nbsp;<span class="fas fa-fw fa-copy"></span></button>
					  		</div>
				  		</div>
				  		<br>
				  	</div>
				  	<div class="card-block">
				  		<div class="container-fluid">
				  			<div class="row">
						  		<table class="table table-bordered table-striped">
						  			<thead>
						  				<th>Field</th>
						  				<th>Type</th>
						  				<th>Null</th>
						  				<th>Key</th>
						  				<th>Default</th>
						  				<th>Extra</th>
						  			</thead>
						  			<tbody v-for="column in col">
						  				<tr>
						  					<td>@{{column.Field}}</td>
						  					<td>@{{column.Type}}</td>
						  					<td>@{{column.Null}}</td>
						  					<td>@{{column.Key}}</td>
						  					<td>@{{column.Default}}</td>
						  					<td>@{{column.Extra}}</td>
						  				</tr>
						  			</tbody>
						  		</table>
					  		</div>
				  		</div>
					</div>
				</div>
			</div>
			<div v-if="menu == 'READ'">
				<div class="card">
				  	<div class="card-header">
				  		<div class="container-fluid">
					  		<div class="row">
					  			<input type="text" class="form-control col-md-7" v-bind:value="'GET | {{url()}}/api/{{$table}}/'+id" readonly>&nbsp;
					  			<a target="_blank" v-bind:href="'{{url()}}/api/{{$table}}/'+id" class="col-md-2 btn btn-success">Tab Baru</a>&nbsp;
					  			<button v-clipboard:copy="copy" class="col-md-2 btn btn-primary" v-clipboard:success="onCopy" v-clipboard:error="onError" alt="Copy!">Copy&nbsp;<span class="fas fa-fw fa-copy"></span></button>
					  		</div>
				  		</div>
				  		<br>
				    	<pre style="color:red;">$ curl -X GET "<span class="text-muted" style="background-color: rgba(0,0,0,0.1)">{{url()}}</span>/api/{{$table}}/@{{id}}"</pre>
				    	<input type="text" v-model="id" placeholder="Search by ID" class="form-control" v-on:keyup="showJSON()">
				  	</div>
				  	<div class="card-block">
						<textarea readonly class="col-12" v-model="json" style="font-family:Courier New;height:330px; padding: none;"></textarea>
					</div>
				</div>
			</div>
			<div v-if="menu == 'UPDATE'">
				<div class="card">
				  	<div class="card-header">
				  		<div class="container-fluid">
					  		<div class="row">
					  			<input type="text" class="form-control col-md-7" v-bind:value="'POST | {{url()}}/api/{{$table}}/'+id" readonly>&nbsp;
					  			<button v-clipboard:copy="copy" class="col-md-2 btn btn-primary" v-clipboard:success="onCopy" v-clipboard:error="onError" alt="Copy!">Copy&nbsp;<span class="fas fa-fw fa-copy"></span></button>
					  		</div>
				  		</div>
				  		<br>
				    	<input type="text" v-model="id" placeholder="Search by ID" class="form-control" v-on:keyup="showJSON()">
				  	</div>
				  	<div class="card-block">
						<textarea readonly class="col-12" v-model="json" style="font-family:Courier New;height:330px; padding: none;"></textarea>
					</div>
				</div>
			</div>
			<div v-if="menu == 'DELETE'">
				<div class="card">
				  	<div class="card-header">
				  		<div class="container-fluid">
					  		<div class="row">
					  			<input type="text" class="form-control col-md-7" v-bind:value="'DELETE | {{url()}}/api/{{$table}}/'+id" readonly>&nbsp;
					  			<button v-clipboard:copy="copy" class="col-md-2 btn btn-primary" v-clipboard:success="onCopy" v-clipboard:error="onError" alt="Copy!">Copy&nbsp;<span class="fas fa-fw fa-copy"></span></button>
					  		</div>
				  		</div>
				  		<br>
				    	<pre style="color:red;">$ curl -X DELETE "<span class="text-muted" style="background-color: rgba(0,0,0,0.1)">{{url()}}</span>/api/{{$table}}/@{{id}}"</pre>
				    	<input type="text" v-model="id" placeholder="Search by ID" class="form-control" v-on:keyup="showJSON()">
				  	</div>
				  	<div class="card-block">
						<textarea readonly class="col-12" v-model="json" style="font-family:Courier New;height:330px; padding: none;"></textarea>
					</div>
				</div>
			</div>
		</div>

	</div>
@endsection

@section('js')
	<script type="text/javascript">
		$(document).ready(function(){
			$('#link-table').addClass('active');
		});
	</script>
@endsection