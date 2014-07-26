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

reloadTreeview = function() {
    $("div#books_tree").fancytree("getTree").load();
};

$(function() {
    initSortableTable();

    $('a[data-reload-treeview]').click(function(){
        reloadTreeview();
    })
});

$('.ckeditor').ckeditor({
    // optional config
});
