$(function() {
    numberOfHeadings = function() {
        var $content = '<div>' + $("#chunk_content").text() + '</div>'
        var $jquery = $($content);

        return $("h1,h2,h3,h4,h5,h6", $content).length
    };

    $("#dialog").dialog({
        autoOpen: false
    });

    $(".diff-link").on("ajax:success", function(e, data, status, xhr) {
            var result = JSON.parse(xhr.responseText);
            var dialog_element = $("#dialog");
            dialog_element.html(result.content);
            dialog_element.dialog("open");
        }
    ).on("ajax:error", function(e, xhr, status, error) {
        var dialog_element = $("#dialog");
        dialog_element.html("Die Version ist aktuell leider nicht verfügbar :-(");
        dialog_element.dialog("open");
    });
});
