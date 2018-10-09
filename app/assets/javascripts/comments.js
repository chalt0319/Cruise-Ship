function addComment(passenger, excursion, pe) {
 let url = `/passengers/${passenger}/excursions/${excursion}/passenger_excursions/${pe}/edit`
 $.get(url, function (response) {
   $(".id_" + excursion).append(response)
   // $(".add_comment_form").submit(function (e) {
   //   e.preventDefault()
   //   submitComment(passenger, excursion, pe)
   // })
 })
}


function submitComment(passenger, excursion, pe) {
  let url = `/passengers/${passenger}/excursions/${excursion}/passenger_excursions/${pe}`
  // let url = this.action
  // debugger
  let excursionId = excursion
  let data = {passenger: passenger, excursion: excursion, comment: $(`.comment_text_area_${excursionId}`).last().val()}
  let posting = $.post(url, data)

  posting.done(function (info) {
    // debugger
    $(".edit_passenger_excursion").hide()
    $(".id_" + info.excursion_id + " .add_comment").text("Edit Comment")
    $(".commentList_" + excursionId).text("")
    $(".commentList_" + excursionId).append(`<li class="comment_${info.id}">` + info.comment + " - " + `<span class="link" onclick="deleteComment(${info.passenger_id}, ${info.excursion_id}, ${info.id})">Delete</span>` + "</li>")
    $(".add_comment_form").hide()
  })
}

function deleteComment(p, e, pe) {
  let url = `/passengers/${p}/excursions/${e}/passenger_excursions/${pe}/delete`
  $.get(url, function (response) {
    $(".comment_" + pe).remove()
    $(".id_" + e + " .add_comment").text("Add Comment")
  })
}
