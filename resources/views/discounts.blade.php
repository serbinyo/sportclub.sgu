@extends('layouts.main-layout')

@section('content')

    <section>
        @if($admin)
            @include('common.menu_label')

            <table class="table-view">
                <tr class="topic">
                    <td>Стаж в клубе</td>
                    <td>Процент скидки</td>
                </tr>
                @foreach($discounts as $discount)

                    <tr>
                        <td style="text-align: center">
                            {{$discount->стаж}}
                        </td>
                        <td style="text-align: center">
                            {{$discount->скидка}}
                            %
                        </td>
                    </tr>

                @endforeach
            </table>
            {{$discounts->links()}}

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