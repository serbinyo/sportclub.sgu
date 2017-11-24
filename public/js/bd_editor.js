jQuery(document).ready(function ($) {
    var entityId_array = indexator($);


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
                                $('.entity_update_link').off();
                                $(entityId_array[entityId_array.length - 1]).remove();
                                entityId_array = indexator($);



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

            data = $(editFormId).serializeArray();

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
                                $('#col1' + html['entity']['entity_id']).text(
                                    html['entity']['lastname'] + ' ' +
                                    html['entity']['firstname'] + ' ' +
                                    html['entity']['middlename']
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
    var editbox = document.getElementsByClassName('entity_editcontainer'),
        addbtn = document.getElementsByClassName('entity_update_link'),
        editform = document.getElementsByClassName('edit_form'),
        submit = document.getElementsByClassName('edit_submit'),
        entity_cont = document.getElementsByClassName('entity_container'),
        editBoxId = [],
        editFormId = [],
        entityId = [],
        submitId = [],
        btnOpenId = [];

    for (i = 0; i < addbtn.length; i++) {
        var entityId_tmp = entity_cont[i].id;
        entityId[i] = "#" + entityId_tmp;

        var btnOpenId_tmp = addbtn[i].id;
        btnOpenId[i] = '#' + btnOpenId_tmp;

        var editboxId_tmp = editbox[i].id;
        editBoxId[i] = "#" + editboxId_tmp;

        var editformId_tmp = editform[i].id;
        editFormId[i] = "#" + editformId_tmp;

        var submitId_tmp = submit[i].id;
        submitId[i] = "#" + submitId_tmp;

        addJQueryHandler(btnOpenId[i], editBoxId[i], $);
        editAjax(submitId[i], editFormId[i], editBoxId[i], $);
    }

    return entityId;
}

