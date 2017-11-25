@extends('layouts.main-layout')

@section('content')

	<section>
		@if($admin)
			@include('common.menu_label')

			<table class="table-view">
				<tr class="topic">
					<td>Название</td>
					<td>Описание</td>
					<td>Стоимость занятия</td>
					<td>Ставка тренера</td>
				</tr>
				@foreach($sportsmanships as $sportsmanship)

					<tr>
						<td>
							{{$sportsmanship->название}}
						</td>
						<td>
							{{$sportsmanship->описание}}
						</td>
						<td>
							{{$sportsmanship->стоимость}}
						</td>
						<td>
							{{$sportsmanship->ставка_тренера}}
						</td>
					</tr>

				@endforeach
			</table>
			{{$sportsmanships->links()}}

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