@extends('layouts.main-layout')

@section('content')

    <section>
        @if($admin)
            @include('common.menu_label')

            <table class="table-view">
                <tr class="topic">
                    <td>ФИО</td>
                    <td>СНИЛС</td>
                    <td>Адрес</td>
                    <td>Телефон</td>
                    <td>Квалификация</td>
                    <td>Дата трудоустройства</td>
                </tr>
                @foreach($instructors as $instructor)

                    <tr>
                        <td>
                            {{$instructor->фамилия}}
                            {{$instructor->имя}}
                            {{$instructor->отчество}}
                        </td>
                        <td>
                            {{$instructor->снилс}}
                        </td>
                        <td>
                            {{$instructor->улица}}, д.
                            {{$instructor->дом}},
                            {{$instructor->квартира}}
                        </td>
                        <td>
                            {{$instructor->телефон}}
                        </td>
                        <td>
                            {{$instructor->квалификация}}
                        </td>
                        <td>
                            {{$instructor->дата_приема_на_работу}}
                        </td>
                    </tr>

                @endforeach
            </table>
            {{$instructors->links()}}

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