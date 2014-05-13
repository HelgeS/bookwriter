initSortableTable = function() {
    var fixHelper = function (e, ui) {
        ui.children().each(function () {
            $(this).width($(this).width());
        });
        return ui;
    };

    $("#sortable tbody").sortable({
        helper: fixHelper
    }).disableSelection();
};