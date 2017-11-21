@extends('layouts.main-layout')

@section('content')

<section>
	<div class="main_lable">
		Клиентское приложение для работы с базой данных Спортивный клуб
	</div>
	<table class="ava_table">
		<tbody>
			<tr>
				<td>
					<img src="/public/img/ava.png"  width="250" alt=""/>
				</td>
				<td class="lr_column">
					<h3>
						Теория баз данных <br><br>
						Сербин Александр Александрович
					</h3>
					<div class="to_right">
					<p>
						<strong>
							группа: ИС/б-41-з
						</strong>
					</p>
					<p>
						Лабораторная работа №4
					</p>
					<p>
						Создание программного приложения для<br>
						работы с базой данных.<br> Тестирование
						базы данных
					</p>
					<p>
						Вариант 18
					</p>
					</div>
					<p>
						Ноябрь 2017
					</p>
				</td>
			</tr>
		</tbody>
	</table>
	<table class="enter_table">
		<tbody>
			<tr>
				<td class="enter_buttons">
					<div id="mybutton-client"> Я клиент </div>

				</td>
				<td class="enter_buttons">
					<div id="mybutton-coach"> Я тренер </div>

				</td>
				<td class="enter_buttons">
					<div id="mybutton-admin"> Я администратор </div>

				</td>
			</tr>
			<tr>
				<td>
					<div class="login_form_container" id="login-client-container">
						@if($user)
							<form action='{{route('userAuthorize')}}' method='post'>
								<input type='hidden' name='action' value='logout' >
								Вход выполнен
								<div class='enter_btn'>
									<input type='submit' value='Выйти'>
								</div>
								{{ csrf_field() }}
							</form>
						@else
							<form action='{{route('userAuthorize')}}' method='post'>
								Логин: <input type='text' name='login'> <br>
								Пароль: <input type='password' name='passwd'> <br>
								<div class='enter_btn'>
									<input type='submit' name='go' value='Вход'>
								</div>
								{{ csrf_field() }}
							</form>
						@endif
					</div>
				</td>
				<td>
					<div class="login_form_container"  id="login-coach-container">
						@if($user)
							<form action='{{route('userAuthorize')}}' method='post'>
								<input type='hidden' name='action' value='logout' >
								Вход выполнен
								<div class='enter_btn'>
									<input type='submit' value='Выйти'>
								</div>
								{{ csrf_field() }}
							</form>
						@else
							<form action='{{route('userAuthorize')}}' method='post'>
								Логин: <input type='text' name='login'> <br>
								Пароль: <input type='password' name='passwd'> <br>
								<div class='enter_btn'>
									<input type='submit' name='go' value='Вход'>
								</div>
								{{ csrf_field() }}
							</form>
						@endif
					</div>
				</td>
				<td>
					<div class="login_form_container"  id="login-admin-container">
						@if($user)
							<form action='{{route('userAuthorize')}}' method='post'>
								<input type='hidden' name='action' value='logout' >
								Вход выполнен
								<div class='enter_btn'>
									<input type='submit' value='Выйти'>
								</div>
								{{ csrf_field() }}
							</form>
						@else
							<form action='{{route('userAuthorize')}}' method='post'>
								Логин: <input type='text' name='login'> <br>
								Пароль: <input type='password' name='passwd'> <br>
								<div class='enter_btn'>
									<input type='submit' name='go' value='Вход'>
								</div>
								{{ csrf_field() }}
							</form>
						@endif
					</div>
				</td>
			</tr>

		</tbody>
	</table>
</section>

@endsection