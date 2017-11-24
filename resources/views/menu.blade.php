@extends('layouts.main-layout')

@section('content')

    <section>
        @if($admin)

            @include('common.menu_label')

            <ul class="category-list">
                <li>
                    <a href="administrators">
                        Администраторы
                    </a>
                </li>
                <li>
                    <a href="gyms">
                        Спортзалы
                    </a>
                </li>
                <li>
                    <a href="sportmanships">
                        Спортивные направления
                    </a>
                </li>
                <li>
                    <a href="instructors">
                        Тренера
                    </a>
                </li>
                <li>
                    <a href="clients">
                        Клиенты
                    </a>
                </li>
                <li>
                    <a href="discounts">
                        Скидки
                    </a>
                </li>
                <li>
                    <a href="schedule">
                        Расписание занятий
                    </a>
                </li>
                <li>
                    <a href="visitlog">
                        Журнал посещений
                    </a>
                </li>
            </ul>

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