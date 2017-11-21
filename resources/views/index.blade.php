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
					<div id="mybutton-instructor"> Я тренер </div>

				</td>
				<td class="enter_buttons">
					<div id="mybutton-admin"> Я администратор </div>

				</td>
			</tr>
			<tr>
				<td class="enter_buttons">
					<div class="login_form_container" id="login-client-container">

							{!! Form::open([''=>route('userAuthorize')])!!}
							{!! Form::hidden('login-client') !!}
							<div class="form-group">
								{!! Form::label(null, 'Логин: ', ['class'=>'control-label']) !!}
								<div class="form-element">
									{!! Form::text('login', null, ['class'=>'inp']) !!}
								</div>
								<div class="clr"></div>
							</div>
							<div class="form-group">
								{!! Form::label(null, 'Пароль: ', ['class'=>'control-label']) !!}
								<div class="form-element">
									{!! Form::password('passwd', ['class'=>'inp']) !!}
								</div>
								<div class="clr"></div>
							</div>
							<div class="form-group">
								{!! Form::submit('Войти', ['class'=>'form-btn']) !!}
								<div class="clr"></div>
							</div>
							{!! Form::close() !!}

					</div>
				</td>
				<td class="enter_buttons">
					<div class="login_form_container"  id="login-instructor-container">

							{!! Form::open([''=>route('userAuthorize')])!!}
								{!! Form::hidden('login-instructor') !!}
								<div class="form-group">
									{!! Form::label(null, 'Логин: ', ['class'=>'control-label']) !!}
									<div class="form-element">
										{!! Form::text('login', null, ['class'=>'inp']) !!}
									</div>
									<div class="clr"></div>
								</div>
								<div class="form-group">
									{!! Form::label(null, 'Пароль: ', ['class'=>'control-label']) !!}
									<div class="form-element">
										{!! Form::password('passwd', ['class'=>'inp']) !!}
									</div>
									<div class="clr"></div>
								</div>
								<div class="form-group">
										{!! Form::submit('Войти', ['class'=>'form-btn', 'style'=>'background: cornflowerblue']) !!}
									<div class="clr"></div>
								</div>
							{!! Form::close() !!}

					</div>
				</td>
				<td class="enter_buttons">
					<div class="login_form_container"  id="login-admin-container">

							{!! Form::open([''=>route('userAuthorize')])!!}
							{!! Form::hidden('login-admin') !!}
							<div class="form-group">
								{!! Form::label(null, 'Логин: ', ['class'=>'control-label']) !!}
								<div class="form-element">
									{!! Form::text('login', null, ['class'=>'inp']) !!}
								</div>
								<div class="clr"></div>
							</div>
							<div class="form-group">
								{!! Form::label(null, 'Пароль: ', ['class'=>'control-label']) !!}
								<div class="form-element">
									{!! Form::password('passwd', ['class'=>'inp']) !!}
								</div>
								<div class="clr"></div>
							</div>
							<div class="form-group">
								{!! Form::submit('Войти', ['class'=>'form-btn', 'style'=>'background: #e18c8d']) !!}
								<div class="clr"></div>
							</div>
							{!! Form::close() !!}

					</div>
				</td>
			</tr>

		</tbody>
	</table>
</section>

@endsection