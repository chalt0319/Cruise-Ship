function learnLink() {
  $.get("/ships", function (response) {
    $(".all_ships").text("")
    $(".all_ships").append(showShips(response).join(""))
    $(".largest_ship").append('<a class="largest_ship_link" href="/ships/largest_ship">Largest Ship</a>')
  })
}

function showShips(info) {
  let ships = ['<h2 class="ships_header">All Available Ships:</h2>']
  info.forEach(function (ship) {
    let theShip = '<div class="ship_div">'
    + "<h3>" + ship.name + "</h3>"
    + "<ul>"
    +  "<li>Capacity: " + ship.capacity + "</li>"
    +  "<li>Number of Swimming Pools: " + ship.number_of_swimming_pools + "</li>"
    +  "<li>Zip Line: " + ship.zip_line + "</li>"
    +  "<li>Kid Friendly: " + ship.kid_friendly + "</li>"
    +  "<li>Casino: " + ship.casino + "</li>"
    + "</ul>"
    + "</div>"
    ships.push(theShip)
  })
  return ships
}
