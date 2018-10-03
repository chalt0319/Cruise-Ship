// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function () {
  $(".learn_link").click(function (e) {
    debugger
    e.preventDefault()
    $.get("/ships", function (response) {
      $(".all_ships").text("")
      $(".all_ships").append(showShips(response).join(""))
      $(".largest_ship").append('<a href="/ships/largest_ship">Largest Ship</a>')
    })
  })
  $(".add_excursion").click(function (e) {
    debugger
    e.preventDefault()
    var $link = $(this)
    var passengerId = $(".passenger_name").data("id")
    $.get("/passengers/" + passengerId + "/excursions/new", function (response) {
      // console.log(response)
      $link.before(response)
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
