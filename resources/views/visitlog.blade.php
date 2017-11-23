@extends('layouts.main-layout')

@section('content')

    <section>
        @if($admin)
            @include('common.menu_label')

            <table class="table-study">
                <tr class="topic">
                    <td>Посещение</td>
                    <td>Номер клиента</td>
                    <td>ФИО</td>
                    <td>Номер занятия</td>
                    <td>Спортивное направление</td>
                    <td>Спортзал</td>
                    <td>Дата</td>
                </tr>
                @foreach($visitlogs as $visitlog)

                    <tr>
                        <td>{{$visitlog->Посещение}}</td>
                        <td>{{$visitlog->номер_клиента}}</td>
                        <td>
                            {{$visitlog->фамилия}}
                            {{$visitlog->имя}}
                            {{$visitlog->отчество}}
                        </td>
                        <td>{{$visitlog->номер_занятия}}</td>
                        <td>{{$visitlog->спортвное_направление}}</td>
                        <td>{{$visitlog->спортзал}}</td>
                        <td>{{$visitlog->дата}}</td>
                    </tr>

                @endforeach
            </table>
            {{$visitlogs->links()}}

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