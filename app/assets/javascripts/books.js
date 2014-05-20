initSortableTable = function() {
    var fixHelper = function (e, ui) {
        ui.children().each(function () {
            $(this).width($(this).width());
        });
        return ui;
    };

    $("#sortable").find("tbody").sortable({
        helper: fixHelper
    }).disableSelection();
};