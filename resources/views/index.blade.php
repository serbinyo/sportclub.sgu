@extends('layouts.main-layout')

@section('content')

    <section>
        <div class="main_lable">
            <a href="/">
                Клиентское приложение для работы с базой данных Спортивный клуб
            </a>
        </div>
        <table class="ava_table">
            <tbody>
            <tr>
                <td>
                    <img src="/public/img/ava.png" width="250" alt=""/>
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

        @if (!$admin)
            <div class="enter_area">

                <div class="enter_block">
                    <div id="mybutton"> Войти в программу</div>

                </div>


                <div class="enter_block">
                    <div class="login_form_container" id="login-container">

                        {!! Form::open(['url'=>route('userAuthorize')])!!}
                        {!! Form::hidden('login') !!}

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
                            {!! Form::submit('Войти', ['class'=>'enter_button', 'name'=>'do-login']) !!}
                            <div class="clr"></div>
                        </div>
                        {!! Form::close() !!}

                    </div>
                </div>
            </div>
        @else



            @if($admin)

                <div class="enter_area">
                    <div class="hello_label">
                        Администротор
                        {{$admin->фамилия }}
                        {{$admin->имя }}
                        {{$admin->отчество }}
                    </div>

                    <table class="hello_table">
                        <tbody>
                        <tr>
                            <td>
                                <a href="menu" class="enter_button">Продолжить</a>
                            </td>
                            <td>
                                {!! Form::open(['url'=>route('userAuthorize')]) !!}
                                {!! Form::submit('   Выйти  ',['class'=>'enter_button']) !!}
                                {!! Form::close() !!}
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>

            @endif

        @endif
    </section>

@endsection