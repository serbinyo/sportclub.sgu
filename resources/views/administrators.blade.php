@extends('layouts.main-layout')

@section('links')
    <script type="text/javascript" src="/public/js/bd_editor.js"></script>
@endsection

@section('content')

    <section>
        @if($admin)
            @include('common.menu_label')

            <div class="entity_addcontainer">
                <h3>Форма добавления публикации</h3>

                {!! Form::open(['url' => route('administrators.store'),'class' => 'form','id'=>'addform']) !!}
                <div class="message js-form-message"></div>

                <div class="form-group">
                    {!! Form::label(null, 'Фамилия:',
                        ['class' =>'control-label']) !!}
                    <div class='form-element'>
                        {!! Form::text('lastname', null,
                        ['class'=>'inp',
                        'id'=>"lastname",
                        'title'=>'Обязательно к заполнению']) !!}
                    </div>
                    <div class="clr"></div>
                </div>

                <div class='form-group'>
                    {!! Form::label(null, 'Имя:',
                    ['class' =>'control-label']) !!}

                    <div class='form-element'>
                        {!! Form::text('firstname', null,
                        ['class'=>'inp',
                        'id'=>"firstname",
                        'title'=>'Обязательно к заполнению']) !!}
                    </div>

                    <div class='clr'></div>
                </div>

                <div class='form-group'>
                    {!! Form::label(null, 'Отчество:',
                    ['class' =>'control-label']) !!}

                    <div class='form-element'>
                        {!! Form::text('middlename', null,
                        ['class'=>'inp',
                        'id'=>"middlename",
                        'title'=>'Обязательно к заполнению']) !!}
                    </div>

                    <div class='clr'></div>
                </div>

                <div class='form-group'>
                    {!! Form::label(null, 'Номер спортзала:',
                    ['class' =>'control-label']) !!}

                    <div class='form-element'>
                        {!! Form::text('gym_id', null,
                        ['class'=>'inp',
                        'id'=>"middlename",
                        'title'=>'Обязательно к заполнению']) !!}
                    </div>

                    <div class='clr'></div>
                </div>

                <div class='form-group'>
                    {!! Form::label(null, 'СНИЛС:',['class' =>'control-label']) !!}
                    <div class='form-element'>
                        {!! Form::text('snils', null,
                        ['class'=>'inp',
                        'id'=>"snils",
                        'title'=>'Не обязательно к заполнению']) !!}
                    </div>
                    <div class='clr'></div>
                </div>

                <div class='form-group'>
                    {!! Form::label(null, 'Улица проживания:',['class' =>'control-label']) !!}
                    <div class='form-element'>
                        {!! Form::text('street', null,
                        ['class'=>'inp',
                        'id'=>"street",
                        'title'=>'Обязательно к заполнению']) !!}
                    </div>
                    <div class='clr'></div>
                </div>

                <div class='form-group'>
                    {!! Form::label(null, 'Номер дома:',['class' =>'control-label']) !!}
                    <div class='form-element'>
                        {!! Form::text('house', null,
                        ['class'=>'inp',
                        'id'=>"house",
                        'title'=>'Обязательно к заполнению']) !!}
                    </div>
                    <div class='clr'></div>
                </div>

                <div class='form-group'>
                    {!! Form::label(null, 'Номер квартиры:',['class' =>'control-label']) !!}
                    <div class='form-element'>
                        {!! Form::text('apartment', null,
                        ['class'=>'inp',
                        'id'=>"apartment",
                        'title'=>'Обязательно к заполнению']) !!}
                    </div>
                    <div class='clr'></div>
                </div>

                <div class='form-group'>
                    {!! Form::label(null, 'Телефон:',['class' =>'control-label']) !!}
                    <div class='form-element'>
                        {!! Form::text('tel', null,
                        ['class'=>'inp',
                        'id'=>"tel",
                        'title'=>'Обязательно к заполнению']) !!}
                    </div>
                    <div class='clr'></div>
                </div>

                <div class="form-group">
                    {!! Form::label(null, '&nbsp;',['class' =>'control-label']) !!}
                    <div class="form-element">
                        {!! Form::submit('Добавить', ['class'=>'form-btn', 'id' => "addform-submit"]) !!}
                        {!! Form::reset('Очистить', ['class'=>'form-btn-clear']) !!}
                    </div>
                    <div class="clr"></div>
                </div>
                {!! Form::close() !!}

            </div>











            @foreach($entities as $entity)
                <div id="entities">

                    <div class="entity_container" id="article{{$entity->id}}">
                        <div class='entity_col1' id='col1{{$entity->id}}'>
                            {{$entity->фамилия}}
                            {{$entity->имя}}
                            {{$entity->отчество}}
                        </div>
                        <div class='entity_col2' id='col2{{$entity->id}}'>
                            {{$entity->снилс}}
                        </div>
                        <div class='entity_col3' id='col3{{$entity->id}}'>
                            ул.{!!$entity->улица!!},
                            д.{!!$entity->дом!!},
                            {!!$entity->квартира!!}
                        </div>

                        <div class='entity_col3' id='col4{{$entity->id}}'>
                            {!!$entity->телефон!!}
                        </div>

                        <div class='entity_col4' id='col5{{$entity->id}}'>{{$entity->дата_приема_на_работу}}</div>

                        <div class='entity_link_container'>
                            <div class="entity_update_link" id="edit{{$entity->id}}" style="cursor:pointer">
                                Редактировать
                            </div>
                            {!! Form::open(['url'=>route('administrators.destroy', ['id'=>$entity->id])]) !!}
                            {!! Form::submit('Удалить', ['class'=>'entity_delete_link']) !!}
                            {{method_field('DELETE')}}
                            {!! Form::close() !!}
                            <div style="clear: left"></div>
                        </div>
                    </div>
                    <br>

                    <!--вывод блока редактирования записи-->
                    <div id='editablebox{{$entity->id}}' class='entity_editcontainer' style='display: none'>
                        <h3>Форма редактирования</h3>

                        {!! Form::open(['url' => route('administrators.store'),'class' => 'edit_form', 'id'=>"edit_form$entity->id"]) !!}
                        {!! Form::hidden('entity_id', $entity->id) !!}

                        <div class='message js-form-message'></div>

                        <div class='form-group'>
                            {!! Form::label(null, 'Фамилия:',
                                ['class' =>'control-label']) !!}

                            <div class='form-element'>
                                {!! Form::text('lastname', $entity->фамилия,
                                ['class'=>'inp',
                                'id'=>"title$entity->id",
                                'title'=>'Обязательно к заполнению']) !!}
                            </div>

                            <div class='clr'></div>
                        </div>

                        <div class='form-group'>
                            {!! Form::label(null, 'Имя:',
                            ['class' =>'control-label']) !!}

                            <div class='form-element'>
                                {!! Form::text('firstname', $entity->имя,
                                ['class'=>'inp',
                                'title'=>'Обязательно к заполнению']) !!}
                            </div>

                            <div class='clr'></div>
                        </div>

                        <div class='form-group'>
                            {!! Form::label(null, 'Отчество:',
                            ['class' =>'control-label']) !!}

                            <div class='form-element'>
                                {!! Form::text('middlename', $entity->отчество,
                                ['class'=>'inp',
                                'title'=>'Обязательно к заполнению']) !!}
                            </div>

                            <div class='clr'></div>
                        </div>

                        <div class='form-group'>
                            {!! Form::label(null, 'СНИЛС:',['class' =>'control-label']) !!}
                            <div class='form-element'>
                                {!! Form::text('snils', $entity->снилс,
                                ['class'=>'inp',
                                'title'=>'Не обязательно к заполнению']) !!}
                            </div>
                            <div class='clr'></div>
                        </div>

                        <div class='form-group'>
                            {!! Form::label(null, 'Улица проживания:',['class' =>'control-label']) !!}
                            <div class='form-element'>
                                {!! Form::text('street', $entity->улица,
                                ['class'=>'inp',
                                'title'=>'Обязательно к заполнению']) !!}
                            </div>
                            <div class='clr'></div>
                        </div>

                        <div class='form-group'>
                            {!! Form::label(null, 'Номер дома:',['class' =>'control-label']) !!}
                            <div class='form-element'>
                                {!! Form::text('house', $entity->дом,
                                ['class'=>'inp',
                                'title'=>'Обязательно к заполнению']) !!}
                            </div>
                            <div class='clr'></div>
                        </div>

                        <div class='form-group'>
                            {!! Form::label(null, 'Номер квартиры:',['class' =>'control-label']) !!}
                            <div class='form-element'>
                                {!! Form::text('apartment', $entity->квартира,
                                ['class'=>'inp',
                                'title'=>'Обязательно к заполнению']) !!}
                            </div>
                            <div class='clr'></div>
                        </div>

                        <div class='form-group'>
                            {!! Form::label(null, 'Телефон:',['class' =>'control-label']) !!}
                            <div class='form-element'>
                                {!! Form::text('tel', $entity->телефон,
                                ['class'=>'inp',
                                'title'=>'Обязательно к заполнению']) !!}
                            </div>
                            <div class='clr'></div>
                        </div>

                        <div class='form-group'>
                            {!! Form::label(null, '&nbsp;',['class' =>'control-label']) !!}
                            <div class='form-element'>
                                {!! Form::submit('Отредактировать', ['class'=>'edit_submit', 'id' => "submit$entity->id"]) !!}
                                {!! Form::reset('Сбросить изменения', ['class'=>'form-btn-clear']) !!}
                            </div>
                            <div class='clr'></div>
                        </div>
                        {!! Form::close() !!}

                    </div>
                    @endforeach
                </div>
                {{$entities->links()}}


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