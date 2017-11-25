@extends('layouts.main-layout')

@section('content')

    <section>
        @if($admin)
            @include('common.menu_label')

            <h1>Поиск по фамилии:</h1>
            <form action="{{route('clients.store')}}" method="post">
                <div class="form-group" style="float:left; width: 60%">
                    <label class="control-label">Фамилия клиента:</label>
                    <div class="form-element">
                        <input type="text" name="lastname" id="lastname" value="" class="inp" style="width: 140%" autofocus/>
                    </div>
                    <div class="clr"></div>
                </div>
                <input type="submit" value="Найти" style="margin: 6px 0 0 5px;"/>
                <div style="clear: both"></div>
                <!--Защита от CSRF атак-->
                {{ csrf_field() }}
            </form>

            @if (!empty($found_clients))

                <table class="table-view">
                    <tr class="topic">
                        <td>ФИО</td>
                        <td>Стаж в клубе</td>
                        <td>Телефон</td>
                        <td>Баланс счета</td>
                        <td>Дата вступления</td>
                    </tr>
                    @foreach($found_clients as $found_client)
                    <tr>
                        <td>
                            {{$found_client->фамилия}}
                            {{$found_client->имя}}
                            {{$found_client->отчество}}
                        </td>
                        <td>
                            {{$found_client->стаж_клиента}}
                        </td>
                        <td>
                            {{$found_client->телефон}}
                        </td>
                        <td>
                            {{$found_client->баланс_счета}}
                        </td>
                        <td>
                            {{$found_client->дата_вступления}}
                        </td>
                    </tr>
                    @endforeach
                </table>

            @endif

            {{--<table class="table-view">--}}
                {{--<tr class="topic">--}}
                    {{--<td>ФИО</td>--}}
                    {{--<td>Стаж в клубе</td>--}}
                    {{--<td>Телефон</td>--}}
                    {{--<td>Баланс счета</td>--}}
                    {{--<td>Дата вступления</td>--}}
                {{--</tr>--}}
                {{--@foreach($clients as $client)--}}

                    {{--<tr>--}}
                        {{--<td>--}}
                            {{--{{$client->фамилия}}--}}
                            {{--{{$client->имя}}--}}
                            {{--{{$client->отчество}}--}}
                        {{--</td>--}}
                        {{--<td>--}}
                            {{--{{$client->стаж_клиента}}--}}
                        {{--</td>--}}
                        {{--<td>--}}
                            {{--{{$client->телефон}}--}}
                        {{--</td>--}}
                        {{--<td>--}}
                            {{--{{$client->баланс_счета}}--}}
                        {{--</td>--}}
                        {{--<td>--}}
                            {{--{{$client->дата_вступления}}--}}
                        {{--</td>--}}
                    {{--</tr>--}}

                {{--@endforeach--}}
            {{--</table>--}}
            {{--{{$clients->links()}}--}}

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