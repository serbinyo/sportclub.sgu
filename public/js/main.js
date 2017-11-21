jQuery(document).ready(function($) {
    addJQueryHandler('#mybutton-client','#login-client-container', $);
    addJQueryHandler('#mybutton-instructor','#login-instructor-container', $);
    addJQueryHandler('#mybutton-admin','#login-admin-container', $);
});
function addJQueryHandler(JQBtnOpenId, JQeditBoxId, $)
{
    $(JQBtnOpenId).click(function()
    {
        var elementStyle = $(JQeditBoxId).css('display');
        if (elementStyle === 'none')
            $(JQeditBoxId).css('display','block');
        else
            $(JQeditBoxId).css('display','none');
    });
}