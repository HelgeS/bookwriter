$(function () {
    /* This is fancytree from https://github.com/mar10/fancytree */
    $("div#books_tree").fancytree({
        source: {
            url: $("#books_tree").data("url"),
            cache: false
        },
        checkbox: false,
        icons: true,
        clickFolderMode: 1,
        selectMode: 1,
        imagePath: '/assets/',
        minExpandLevel: 2,
        extensions: ["dnd"],
        dnd: {
            preventVoidMoves: true, // Prevent dropping nodes 'before self', etc.
            preventRecursiveMoves: true, // Prevent dropping nodes on own descendants
            autoExpandMS: 300,
            dragStart: function(node, data) {
                /** This function MUST be defined to enable dragging for the tree.
                 *  Return false to cancel dragging of node.
                 */
                return true;
            },
            dragEnter: function(node, data) {
                /** data.otherNode may be null for non-fancytree droppables.
                 *  Return false to disallow dropping on node. In this case
                 *  dragOver and dragLeave are not called.
                 *  Return 'over', 'before, or 'after' to force a hitMode.
                 *  Return ['before', 'after'] to restrict available hitModes.
                 *  Any other return value will calc the hitMode from the cursor position.
                 */
                // Prevent dropping a parent below another parent (only sort
                // nodes under the same parent)
                if(node.parent !== data.otherNode.parent){
                    return false;
                }

                // Don't allow dropping *over* a node (would create a child)
                return ["before", "after"];
            },
            dragDrop: function(node, data) {
                /** This function MUST be defined to enable dropping of items on
                 *  the tree.
                 */
                data.otherNode.moveTo(node, data.hitMode);

                $.ajax({
                    type: 'PUT',
                    url: data.otherNode.data.position_url,
                    contentType: "application/json",
                    data: JSON.stringify({chunk:{position:data.otherNode.getIndex()+1}, _method:'put'}),
                    context: data
                }); /*.done(function (msg) {
                    $.get(this.node.parent.data.href, { 'render_template': false }, function (new_data) {
                        $("div#content").html(new_data);
                    });
                });*/
            }
        },
        click: function(event, data) {

            window.location = data.node.data.href;
        }
    });
});
