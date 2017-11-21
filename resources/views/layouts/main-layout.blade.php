<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="csrf-token" content="{{ csrf_token() }}">
		<title>
			Спортклуб. Пользователь
		</title>
		<link rel="stylesheet" type="text/css" href="{{ asset('public/css/style.css') }}">
		<script src="{{asset('public/js/jquery-3.2.1.min.js')}}"></script>
		<script type="text/javascript" src="{{ asset('public/js/main.js') }}"></script>

		@yield('links')

	</head>
	<body>
		<div id="wrapper">

			<header>
			</header>
			<main>

				@include('common.errors')
				
				<div id="current-date"></div>
				
				@if($user)

				<div class='login_form_container'>
				Пользователь: {{$user->fio}}
				</div>
				
				@endif
				
				@yield('content')
				<div class="wrap_result"></div>
				
			</main>
		</div>
		<footer>
			<p>
				Copyright &copy; 2017 Serbin Alexandr
			</p>
		</footer>
	</body>
</html>