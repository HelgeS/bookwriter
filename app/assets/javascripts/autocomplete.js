$(document).ready(function () {
    $('#chunk_username').autocomplete({
        source: '/autocomplete/users',
        select: function(event,ui) {
            $('#chunk_user_id').val(ui.item.id);
        }
    });

    function split(val) {
        return val.split(/,\s*/);
    }
    function extractLast(term) {
        return split(term).pop();
    }

    $('#book_usernames').bind("keydown", function(event) {
        if (event.keyCode === $.ui.keyCode.TAB && $.data('book_usernames').menu.active) {
            event.preventDefault();
        } else if (event.keyCode === 8) { // Backspace
            var user_ids = $('#book_user_ids');
            var user_ids_value = split(user_ids.attr('value'));
            user_ids_value.pop();
            user_ids_value.push("");
            user_ids.value = user_ids_value.join(", ");

            var terms = split(this.value);
            terms.pop();
            terms.push("");
            this.value = terms.join(", ");
        }
    }).autocomplete({
        source: function(request, response) {
            $.getJSON('/autocomplete/users', { term: extractLast(request.term) }, response);
        },
        search: function() {
            var minLength = 3;
            var term = extractLast(this.value);

            if (term.length < minLength) {
                return false;
            }
        },
        focus: function() {
            return false;
        },
        select: function(event, ui) {
            var user_ids = $('#book_user_ids');
            var user_ids_value = split(user_ids.value);
            user_ids_value.pop();
            user_ids_value.push(ui.item.id);
            user_ids_value.push("");
            user_ids.value = user_ids_value.join(", ");

            var terms = split(this.value);
            terms.pop();
            terms.push(ui.item.value);
            terms.push("");
            this.value = terms.join(", ");
            return false;
        }
    });
});