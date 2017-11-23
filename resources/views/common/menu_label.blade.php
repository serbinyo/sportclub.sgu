<div class="mainlable_area">
    <div class="menu_label">
        Администротор
        {{$admin->фамилия }}
        {{$admin->имя }}
        {{$admin->отчество }}
    </div>
    <div class="menu_buttons">
        <a href="menu" class="enter_button enter_menu_buttons">Меню</a>
    </div>
    <div class="menu_buttons">
        {!! Form::open(['url'=>route('userAuthorize')]) !!}
        {!! Form::submit('   Выйти  ',['class'=>'enter_button enter_menu_buttons']) !!}
        {!! Form::close() !!}
    </div>
    <div style="clear: both"></div>
</div>