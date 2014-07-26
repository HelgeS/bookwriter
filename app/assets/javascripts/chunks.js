$(function() {
    numberOfHeadings = function() {
        var $content = '<div>' + $("#chunk_content").text() + '</div>'
        var $jquery = $($content);

        return $("h1,h2,h3,h4,h5,h6", $content).length
    };

    showDiff = function() {
        var dialog_element = $("#dialog");
        dialog_element.html(diffString("The red <em>brown</em> fox jumped over the rolling log.",
            "The brown spotted fox leaped over the <i>rolling</i> log"));
        dialog_element.dialog("open");
    };

    $("#dialog").dialog({
        autoOpen: false
    });
});

$('.ckeditor').ckeditor({
    // optional config
});