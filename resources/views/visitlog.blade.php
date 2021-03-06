@extends('layouts.main-layout')

@section('content')

    <section>
        @if($admin)
            @include('common.menu_label')

            <table class="table-view">
                <tr class="topic">
                    <td>Дата</td>
                    <td>№ клиента</td>
                    <td>ФИО</td>
                    <td>Спортивное направление</td>
                    <td>Спортзал</td>

                </tr>
                @foreach($visitlogs as $visitlog)

                    <tr>
                        <td>{{$visitlog->дата}}</td>
                        <td>{{$visitlog->номер_клиента}}</td>
                        <td>
                            {{$visitlog->фамилия}}
                            {{$visitlog->имя}}
                            {{$visitlog->отчество}}
                        </td>
                        <td>{{$visitlog->спортвное_направление}}</td>
                        <td>{{$visitlog->спортзал}}</td>

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