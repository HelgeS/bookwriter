numberOfHeadings = function() {
    var $content = '<div>' + $("#chunk_content").text() + '</div>'
    var $jquery = $($content);

    return $("h1,h2,h3,h4,h5,h6", $content).length
}