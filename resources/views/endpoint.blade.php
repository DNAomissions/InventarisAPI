@extends('app.app')

@section('content')
<br>
	<div class="container" id="endpoint">
		<div class="col-md-10 offset-md-1">
			<div class="jumbotron bg-danger">
				<h2 style="color: white" class="text-center">EndPoint</h2>
				<p>Cara menggunakan API dapat menggunakan awalan <strong>'<span class="text-muted" style="background-color: rgba(255,255,255,0.6)">{{url()}}</span>/api/{table}/{id}'</strong></p>
				<p>Note:
					<ul>
						<li><strong>{id} *optional</strong></li>
					</ul>
				</p>
			</div>
			<p>Daftar Table :</p>
			<div class="row">
				<div class="col-md-6">
					<div v-for="(table,index) in tables">
						<div v-if="index < 7">
							@{{index+1}}. <a target="_blank" v-bind:href="'/detail/'+table.Tables_in_db_inventaris">@{{table.Tables_in_db_inventaris}}</a>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div v-for="(table,index) in tables">
						<div v-if="index >= 7">
							@{{index+1}}. <a target="_blank" v-bind:href="'/detail/'+table.Tables_in_db_inventaris">@{{table.Tables_in_db_inventaris}}</a>
						</div>
					</div>
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