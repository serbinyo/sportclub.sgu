@extends('layouts.main-layout')

@section('content')

	<section>
		@if($admin)
			@include('common.menu_label')

			<table class="table-view">
				<tr class="topic">
					<td>Название</td>
					<td>Адрес</td>
					<td>Телефон</td>
					<td>Ставка администратора</td>
				</tr>
				@foreach($gyms as $gym)

					<tr>
						<td>{{$gym->название}}</td>
						<td>
							{{$gym->улица}}
							{{$gym->дом}}
						</td>
						<td>{{$gym->телефон}}</td>
						<td>
							{{$gym->ставка_администратора}}
						</td>
					</tr>

				@endforeach
			</table>
			{{$gyms->links()}}

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