<nav class="navbar navbar-expand-lg navbar-dark bg-primary" id="header">
	<div class="container">
		<a href="/" class="navbar-brand"><h2>Portal API Inventaris</h2></a>

		<button class="navbar-toggler collapsed" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar-collapse collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a href="/" class="nav-link" id="link-home">HOME &nbsp;<span class="fas fa-fw fa-home"></span><span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a href="/endpoint" class="nav-link" id="link-endpoint">ENDPOINT &nbsp;<span class="fas fa-fw fa-link"></span></a>
				</li>
				<div v-if="table != ''">	
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="link-table">@{{table.toUpperCase()}} &nbsp;<span class="fas fa-fw fa-table"></span></a>
						<div class="dropdown-menu" aria-labeledby="link-table">
							<a class="dropdown-item" href="#" v-on:click.prevent="setMenu('CREATE')">CREATE (POST)</a>
							<a class="dropdown-item" href="#" v-on:click.prevent="setMenu('READ')">READ (GET)</a>
							<a class="dropdown-item" href="#" v-on:click.prevent="setMenu('UPDATE')">UPDATE (POST)</a>
							<a class="dropdown-item" href="#" v-on:click.prevent="setMenu('DELETE')">DELETE (DELETE)</a>
						</div>
					</li>
				</div>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="link-user" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			         	<span class="fas fa-fw fa-user"></span>
			        </a>
			        <div class="dropdown-menu" aria-labelledby="link-user">
			          	<a class="dropdown-item" href="/login"><span class="fas fa-fw fa-sign-in-alt"></span> &nbsp;LOGIN </a>
			        </div>
				</li>
			</ul>
		</div>
	</div>			
</nav>