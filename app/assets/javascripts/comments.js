function addComment(passenger, excursion, pe) {
 let url = `/passengers/${passenger}/excursions/${excursion}/passenger_excursions/${pe}/edit`
 $.get(url, function (response) {
   $(".id_" + excursion).append(response)
 })
}

function submitComment(passenger, excursion, pe) {
  let url = `/passengers/${passenger}/excursions/${excursion}/passenger_excursion/${pe}`
  let excursionId = excursion
  let data = {passenger_id: passenger, excursion_id: excursion, comment: $(`.comment_text_area_${excursionId}`).last().val()}
  var posting = $.post(url, data)

  posting.done(function (info) {
    $(".edit_passenger_excursion").hide()
    $(".commentList_" + excursionId).text("")
    $(".commentList_" + excursionId).append(`<li class="comment_${info.id}">` + info.comment + " - " + `<span class="link" onclick="deleteComment(${info.passenger_id}, ${info.excursion_id}, ${info.id})">Delete</span>` + "</li>")
    $(".add_comment_form").hide()
  })
}

function deleteComment(p, e, pe) {
  let url = `/passengers/${p}/excursions/${e}/passenger_excursions/${pe}/delete`
  $.get(url, function (response) {
    $(".comment_" + pe).remove()
  })
}
