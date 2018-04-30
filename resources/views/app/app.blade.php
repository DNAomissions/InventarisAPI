<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Inventaris Portal API</title>
	<!-- CSS Module -->
		<!-- Bootstrap -->
		<link rel="stylesheet" type="text/css" href="/assets/bootstrap/css/bootstrap.min.css">
		<!-- Font Awesome -->
		<link rel="stylesheet" type="text/css" href="/assets/font-awesome/css/fontawesome-all.min.css">
		<!-- DataTable -->
		<link rel="stylesheet" type="text/css" href="/assets/datatable/css/dataTables.bootstrap4.min.css">

		<style type="text/css">
			.content{
				margin-bottom: 20px;
			}
		</style>
		@yield('css')
</head>
<body>
	@include('app.header')

	<div class="content">
		@yield('content')
	</div>
	<!-- JS Module -->
		<!-- Jquery -->
		<script type="text/javascript" src="/assets/jquery-3.3.1.min.js"></script>
		<!-- Bootstrap -->
		<script type="text/javascript" src="/assets/bootstrap/js/bootstrap.min.js"></script>
		<!-- Sweet Alert -->
		<script type="text/javascript" src="/assets/sweetalert/sweetalert2-all.js"></script>
		<!-- DataTable -->
		<script type="text/javascript" src="/assets/datatable/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="/assets/datatable/js/dataTables.bootstrap4.min.js"></script>
		<!-- Vue 2 -->
		<script type="text/javascript" src="/assets/vue/vue.min.js"></script>

		<!-- MyApp -->
		<script type="text/javascript" src="/js/app.js"></script>

		@yield('js')
</body>
</html>