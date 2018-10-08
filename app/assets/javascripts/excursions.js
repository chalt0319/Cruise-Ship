function addExcursion() {
  let passengerId = $(".passenger_name").data("id")
  $.get(`/passengers/${passengerId}/excursions/new`, function (response) {
    $(".add_excursion").before(response)
    $(".add_excursion").remove()
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
