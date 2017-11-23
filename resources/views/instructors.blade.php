@extends('layouts.main-layout')

@section('content')

	<section>
		@if($admin)
			@include('common.menu_label')

		@else

			<div class="mainlable_area">
				Вы не вошли.
				<a href="/">
					На гравную
				</a>
			</div>

		@endif
	</section>

@endsection