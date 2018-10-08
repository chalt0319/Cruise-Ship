
$(function () {
  // $(".learn_link").click(function (e) {
  //   $.get("/ships", function (response) {
  //     $(".all_ships").text("")
  //     $(".all_ships").append(showShips(response).join(""))
  //     $(".largest_ship").append('<a href="/ships/largest_ship">Largest Ship</a>')
  //   })
  // })
  // $(".add_excursion").click(function (e) {
  //   e.preventDefault()
  //   var $link = $(this)
  //   var passengerId = $(".passenger_name").data("id")
  //   $.get("/passengers/" + passengerId + "/excursions/new", function (response) {
  //     $link.before(response)
  //   })
  // })
  // $(".add_comment").click(function (e) {
  //   e.preventDefault()
  //   var url = $(this).data("url")
  //   var excersionId = $(this).data("id")
  //   $.get(url, function (response) {
  //     $(".id_" + excersionId).append(response)
  //   })
  // })
  $(".delete_link").click(function (e) {
    e.preventDefault()
    var excersionId = $(this).data("id")
    var url = $(this).data("deleteurl")
    $.get(url, function (r) {
      let theTime = new Time(r.time, r.hours)
      $(".total_time").text(theTime.totalTime())
      $(".childId_" + excersionId).remove()
      $(".id_" + excersionId).remove()
    })
  })
  $(".excursion_link").click(function (e) {
    e.preventDefault()
  })
})

class Time {
  constructor(time, hours) {
    this.time = time
    this.hours = hours
  }
  totalTime() {
    return `Total Excursion Time: ${this.time} ${this.hours}.`
  }

}

function showShips(info) {
  let ships = ['<h1>All Available Ships:</h1>']
  info.forEach(function (ship) {
    let theShip = "<h3>" + ship.name + "</h3>"
    + "<ul>"
    +  "<li>Capacity: " + ship.capacity + "</li>"
    +  "<li>Number of Swimming Pools: " + ship.number_of_swimming_pools + "</li>"
    +  "<li>Zip Line: " + ship.zip_line + "</li>"
    +  "<li>Kid Friendly: " + ship.kid_friendly + "</li>"
    +  "<li>Casino: " + ship.casino + "</li>"
    + "</ul>"
    ships.push(theShip)
  })
  return ships
}

function addComment(passenger, excursion, pe) {
 var url = `/passengers/${passenger}/excursions/${excursion}/passenger_excursions/${pe}/edit`
 $.get(url, function (response) {
   $(".id_" + excursion).append(response)
 })
}


function submitComment(passenger, excursion, pe) {
  var url = `/passengers/${passenger}/excursions/${excursion}/passenger_excursion/${pe}`
  var excursionId = excursion
  var data = {comment: $(`.comment_text_area_${excursionId}`).last().val()}
  debugger
  var posting = $.post(url, data)

  posting.done(function (info) {
    console.log(info)
    $(".edit_passenger_excursion").hide()
    $(".childId_" + excursionId).text("")
    $(".childId_" + excursionId).append("- " + info.comment + " - " + `<span class="link comment_${info.id}" onclick="deleteComment(${info.passenger_id}, ${info.excursion_id}, ${info.id})">Delete</span>`)
    $(".add_comment_form").hide()
  })
}

function deleteComment(p, e, pe) {
  var url = `/passengers/${p}/excursions/${e}/passenger_excursions/${pe}/delete`
  $.get(url, function (response) {
    $(".childId_" + e).text("")
  })
}

function showExcursion(passenger, e_id, e_title) {
  var url = `/passengers/${passenger}/excursions/${e_id}`
  $.get(url, function (response) {
    $(".excursion_id_" + e_id).after(response)
    $(".excursion_id_" + e_id).before(`<span class="excursion_title">${e_title}</span>`)
    $(".excursion_id_" + e_id).hide()
  })
}

function learnLink() {
  $.get("/ships", function (response) {
    $(".all_ships").text("")
    $(".all_ships").append(showShips(response).join(""))
    $(".largest_ship").append('<a href="/ships/largest_ship">Largest Ship</a>')
  })
}

function addExcursion() {
  var passengerId = $(".passenger_name").data("id")
  $.get(`/passengers/${passengerId}/excursions/new`, function (response) {
    $(".add_excursion").before(response)
  })
}
