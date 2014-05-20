$(document).ready ->
  $('#chunk_username').autocomplete
    source: "/autocomplete/users"
    select: (event,ui) -> $("#chunk_user_id").val(ui.item.id)