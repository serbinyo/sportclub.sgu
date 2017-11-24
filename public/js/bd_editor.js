jQuery(document).ready(function ($) {

    var entityId_array = indexator($);
    addJQueryHandler('#btn_open_add_entity', '#hiding_block_add_entity', $);


    //обработчик для формы добавления НОВОЙ публикации
    $('#addform').on('click', '#addform-submit', function (e) {
        e.preventDefault();
        //информация о происходящем в ассинхронном запросе для пользователя
        $('.wrap_result').css('color', 'green').text('Сохранение').fadeIn(500, function () {
            //плавно показываем блок(500мс), затем выполняем функцию

            data = $('#addform').serializeArray();

            $.ajax(
                {
                    url: $('#addform').attr('action'),
                    data: data,
                    type: 'POST',
                    headers:
                        {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                    datatype: 'JSON',
                    success: function (html) {
                        if (html.error) {
                            $('.wrap_result').css('color', 'red').append('<br/><strong>Заполните все поля</strong>').delay(900).fadeOut(500);
                        }
                        else if (html.success) {
                            $('.wrap_result').css('color', 'blue').append('<br/><strong>Cохранено успешно</strong>').delay(900).fadeOut(500, function () {
                                $('#entities').prepend(html.entity);
                                $('input').off();
                                $('div').off();
                                $(entityId_array[entityId_array.length - 1]).remove();
                                entityId_array = indexator($);
                                addJQueryHandler('#btn_open_add_entity', '#hiding_block_add_entity', $);
                                $('#hiding_block_add_entity').css('display', 'none');
                            });
                        }
                    },
                    error: function () {
                        $('.wrap_result').css('color', 'red').append('<br/><strong>Ошибка</strong>').delay(900).fadeOut(500);
                    }
                });
        });
    });
});

function addJQueryHandler(btnOpenId, editBoxId, $) {
    $(btnOpenId).click(function () {
        var elementStyle = $(editBoxId).css('display');
        if (elementStyle === 'none')
            $(editBoxId).css('display', 'block');
        else
            $(editBoxId).css('display', 'none');
    });
}

function editAjax(submitId, editFormId, editBoxId, $) {
    $(submitId).click(function (e) {
        e.preventDefault();

        //информация о происходящем в ассинхронном запросе для пользователя
        $('.wrap_result').css('color', 'green').text('Редактирование публикации').fadeIn(500, function () {
            //плавно показываем блок(500мс), затем выполняем функцию

            var data = $(editFormId).serializeArray();

            $.ajax(
                {
                    url: $(editFormId).attr('action'),
                    data: data,
                    type: 'POST',
                    headers:
                        {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                    datatype: 'JSON',
                    success: function (html) {
                        if (html.error) {
                            $('.wrap_result').css('color', 'red').append('<br/><strong>Заполните все поля</strong>').delay(900).fadeOut(500);
                        }
                        else if (html.success) {
                            $('.wrap_result').css('color', 'blue').append('<br/><strong>Отредактировано успешно</strong>').delay(900).fadeOut(500, function () {
                                $(editBoxId).css('display', 'none');
                                $('#col1' + html['entity']['entity_id']).html(
                                    'Сотрудник № '+
                                    html['entity']['entity_id'] + ' ' +
                                    "<span style='font-weight: bold;'>" + ' ' +
                                    html['entity']['lastname'] + ' ' +
                                    html['entity']['firstname'] + ' ' +
                                    html['entity']['middlename'] + ' ' +
                                    "</span>"

                                );
                                $('#col2' + html['entity']['entity_id']).text(
                                    'СНИЛС: ' +
                                    html['entity']['snils']
                                );
                                $('#col3' + html['entity']['entity_id']).text(
                                    'Адрес: ул.' +
                                    html['entity']['street'] + ', д.' +
                                    html['entity']['house'] + ', ' +
                                    html['entity']['apartment']
                                );
                                $('#col4' + html['entity']['entity_id']).text(
                                    'Номер телефона: ' +
                                    html['entity']['tel']
                                );
                                $('#col6' + html['entity']['entity_id']).html(
                                    '<h4>Закреплен в спортзал: ' +
                                    html['entity']['gym'] +
                                    '</h4>'
                                );
                            });
                        }
                    },
                    error: function () {
                        $('.wrap_result').css('color', 'red').append('<br/><strong>Ошибка</strong>').delay(900).fadeOut(500);
                    }
                });
        });
    });
}

function indexator($) {
    var hiding_block = document.getElementsByClassName('hiding_block'),
        btn_open = document.getElementsByClassName('btn_open'),
        edit_form = document.getElementsByClassName('edit_form'),
        submit = document.getElementsByClassName('edit_submit'),
        entity_cont = document.getElementsByClassName('entity_container'),
        card_title_open = document.getElementsByClassName('card_title_open'),
        card_body_block = document.getElementsByClassName('card_body_block'),
        editBoxId = [],
        editFormId = [],
        entityId = [],
        submitId = [],
        btnOpenId = [],
        card_title_openId = [],
        card_body_blockId = [];

    for (var i = 0; i < entity_cont.length; i++) {

        var entityId_tmp = entity_cont[i].id;
        entityId[i] = "#" + entityId_tmp;

        var btn_open_tmp = btn_open[i].id;
        btnOpenId[i] = '#' + btn_open_tmp;

        var hiding_block_tmp = hiding_block[i].id;
        editBoxId[i] = "#" + hiding_block_tmp;

        var editFormId_tmp = edit_form[i].id;
        editFormId[i] = "#" + editFormId_tmp;

        var submitId_tmp = submit[i].id;
        submitId[i] = "#" + submitId_tmp;

        var card_title_open_tmp = card_title_open[i].id;
        card_title_openId[i] = "#" + card_title_open_tmp;

        var card_body_block_tmp = card_body_block[i].id;
        card_body_blockId[i] = "#" + card_body_block_tmp;

        addJQueryHandler(btnOpenId[i], editBoxId[i], $);
        addJQueryHandler(card_title_openId[i], card_body_blockId[i], $);
        editAjax(submitId[i], editFormId[i], editBoxId[i], $);
    }

    return entityId;
}

