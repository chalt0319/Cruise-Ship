
$(function () {
  $(".learn_link").click(function (e) {
    e.preventDefault()
    $.get("/ships", function (response) {
      $(".all_ships").text("")
      $(".all_ships").append(showShips(response).join(""))
      $(".largest_ship").append('<a href="/ships/largest_ship">Largest Ship</a>')
    })
  })
  $(".add_excursion").click(function (e) {
    e.preventDefault()
    var $link = $(this)
    var passengerId = $(".passenger_name").data("id")
    $.get("/passengers/" + passengerId + "/excursions/new", function (response) {
      $link.before(response)
    })
  })
  $(".add_comment").click(function (e) {
    e.preventDefault()
    var url = $(this).data("url")
    var excersionId = $(this).data("id")
    $.get(url, function (response) {
      $(".id_" + excersionId).append(response)
    })
  })
  $(".delete_link").click(function (e) {
    e.preventDefault()
    var excersionId = $(this).data("id")
    var url = $(this).data("deleteurl")
    $.get(url, function (response) {
      $(".total_time").text("Total Excursion Time: " + response.time + " " + response.hours + ".")
      $(".childId_" + excersionId).remove()
      $(".id_" + excersionId).remove()
    })
  })

})

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


function url(passenger, excersion, pe) {
  var url = "/passengers/" + passenger + "/excursions/" + excersion + "/passenger_excursion/" + pe
  console.log(url)
  // debugger
  var data = {comment: $("#passenger_excursion_comment").val()}
  var posting = $.post(url, data)
  var $excursionId = excersion
  posting.done(function (info) {
    console.log(info)
    // debugger
    $(".edit_passenger_excursion").hide()
    $(".id_" + $excursionId).append('<ul><li class="childId_' + $excursionId + '">' + info.comment + '</li>')
    $(".childId_" + $excursionId).text(info.comment)
  })
}
