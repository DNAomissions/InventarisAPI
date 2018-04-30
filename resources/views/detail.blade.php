@extends('app.app')

@section('content')
<br>
	<div class="container" id="detail">
		<div class="col-md-8 offset-md-2">
			<div class="jumbotron bg-danger text-center">
				<h2 style="color: white"></h2>
			</div>
			<p>GET </p>
			<div class="row">
				<div class="col-md-6">
					<div v-for="(table,index) in tables">
						<div v-if="index < 7">
							@{{index+1}}. <a v-bind:href="'/detail/'+table.Tables_in_db_inventaris">@{{table.Tables_in_db_inventaris}}</a>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div v-for="(table,index) in tables">
						<div v-if="index >= 7">
							@{{index+1}}. <a v-bind:href="'/detail/'+table.Tables_in_db_inventaris">@{{table.Tables_in_db_inventaris}}</a>
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