@extends('app.app')

@section('content')
<br>
	<div class="container" id="home">
		<div class="col-md-8 offset-md-2">
			<div class="jumbotron bg-danger text-center">
				<h2 style="color: white">Portal API Inventaris</h2>
			</div>
			<p>Merupakan Dokumentasi tentang API</p>
		</div>
	</div>
@endsection

@section('js')
	<script type="text/javascript">
		$(document).ready(function(){
			$('#link-home').addClass('active');
		});
	</script>
@endsection