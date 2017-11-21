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
					<p>
					<h3>
						Теория баз данных <br><br>
						Сербин Александр Александрович
					</h3>
					</p>
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
		</tbody>
	</table>
</section>

@endsection