function addExcursion() {
  let passengerId = $(".passenger_name").data("id")
  $.get(`/passengers/${passengerId}/excursions/new`, function (response) {
    $(".add_excursion").before(response)
    $(".add_excursion").remove()
    $("#new_excursion").submit(function (e) {
      e.preventDefault()
      let excursionId = $("select[name='excursion[id]']").val()
      let url = `/passengers/${passengerId}/excursions`
      let data = {id: excursionId}
      let posting = $.post(url, data)

      posting.done(function (e) {
        let new_excursion = excursionLi(e["passenger"], e["excursion"], e["port"], e["hours"], e["pe"])
        $(".ul_excursions").append(new_excursion)
        let theTime = new Time(e["total_hours"].time, e["total_hours"].hours)
        $(".total_time").text(theTime.totalTime())
        $("input[name='commit']").prop( "disabled", false )
        $("select[name='excursion[id]']").val("")
        $(".ports_link").show()
        $(".ports").text("")
      })
    })
  })
}

function showExcursion(passenger, e_id, e_title) {
  let url = `/passengers/${passenger}/excursions/${e_id}`
  $.get(url, function (response) {
    $(".excursion_id_" + e_id).after(response)
    $(".excursion_id_" + e_id).before(`<span class="excursion_title">${e_title}</span>`)
    $(".excursion_id_" + e_id).hide()
  })
}

function deleteExcursion(p, e) {
  let excersionId = e
  let url = `/passengers/${p}/excursions/${e}/edit`
  $.get(url, function (r) {
    let theTime = new Time(r.time, r.hours)
    $(".total_time").text(theTime.totalTime())
    $(".commentList_" + excersionId).remove()
    $(".id_" + excersionId).remove()
    $(".ports_link").show()
    $(".ports").text("")
  })
}

class Time {
  constructor(time, hours) {
    this.time = time
    this.hours = hours
  }
  totalTime() {
    return `Total Excursion Time: ${this.time} ${this.hours}.`
  }
}

function excursionLi(p, e, port, hours, pe) {
  let data = '<li class="excursion_info id_'
  + e.id + '">' + e.title + ' - '  + port.location +  ' - '
  + e.duration + " " + hours + ' - ' + '<span class="link add_comment" data-id="' + e.id
  + '" onclick="addComment(' + p.id + ', ' + e.id + ', ' + pe.id
  + ')">Add Comment</span> - <span class="link delete_link"  onclick="deleteExcursion('
  + p.id + ', ' + e.id + ')">Delete</span></li>'
  + '<div class="divChild_' + e.id + '">'
  + '<ul><div class="commentList_' + e.id + '">'
  + '</div></ul></div>'
  return data
}
