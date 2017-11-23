@extends('layouts.main-layout')

@section('content')

    <section>
        @if($admin)
            @include('common.menu_label')

            <table class="table-study">
                <tr class="topic">
                    <td>Дата</td>
                    <td>Спортивное направление</td>
                    <td>Спортзал</td>
                    <td>Адрес</td>
                    <td>Тренер</td>

                </tr>
                @foreach($schedules as $schedule)

                    <tr>
                        <td>{{$schedule->дата}}</td>
                        <td>{{$schedule->спортвное_направление}}</td>
                        <td>{{$schedule->спортзал}}</td>
                        <td>
                            {{$schedule->спортзал_улица}}
                            {{$schedule->спортзал_дом}}
                        </td>
                        <td>
                            {{$schedule->фамилия_тренер}}
                            {{$schedule->имя_тренер}}
                        </td>

                    </tr>

                @endforeach
            </table>
            {{$schedules->links()}}

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