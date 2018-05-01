@extends('app.app')

@section('content')
<br>
	<div class="container" id="detail">
		<div class="col-md-10 offset-md-1">
			<div class="jumbotron bg-danger text-center">
				<h2 style="color: white">{{strtoupper($table)}}</h2>
			</div>
			<div class="card">
			  	<div class="card-header">
			  		<div class="container-fluid">
				  		<div class="row">
				  			<input type="text" class="form-control col-md-9" v-bind:value="'GET {{url()}}/api/{{$table}}/'+id" readonly>
				  			<a target="_blank" v-bind:href="'{{url()}}/api/{{$table}}/'+id" class="col-md-2 btn btn-success">Coba!</a>
				  			<button v-clipboard:copy="copy" class="col-md-1 btn btn-primary" v-clipboard:success="onCopy" v-clipboard:error="onError" alt="Copy!"><span class="fas fa-fw fa-copy"></span></button>
				  		</div>
			  		</div>
			  		<br>
			    	<pre style="color:red;">$ curl -X GET "<span class="text-muted" style="background-color: rgba(0,0,0,0.1)">{{url()}}</span>/api/{{$table}}/@{{id}}"</pre>
			    	<input type="text" v-model="id" placeholder="Search by ID" class="form-control" v-on:keyup="showJSON()">
			  	</div>
			  	<div class="card-block">
			    	<blockquote class="card-blockquote">
							<textarea readonly class="col-12" v-model="json" style="height:350px; padding: none;"></textarea>
			    	</blockquote>
				</div>
			</div>
		</div>
	</div>
@endsection

@section('js')
	<script type="text/javascript">
		$(document).ready(function(){
			$('#link-endpoint').addClass('active');
		});
	</script>
@endsection