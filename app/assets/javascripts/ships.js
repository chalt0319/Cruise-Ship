function learnLink() {
  $.get("/ships", function (response) {
    $(".all_ships").text("")
    $(".all_ships").append(showShips(response).join(""))
    $(".largest_ship").append('<a class="largest_ship_link" href="/ships/largest_ship">Largest Ship</a>')
    ships = response
  })
}

function filterSubmit() {
  $("#filter").submit(function (e) {
    e.preventDefault()
    let filters = $(this).serializeArray()
    let newShips = ships.filter(function (ship) {
      return filters.every(function (attr) {
        return ship[attr.name] === true
      })
    })
    $(".all_ships").text("")
    $(".all_ships").append(showShips(newShips).join(""))
  })
}

function showShips(info) {
  let ships = ['<h2 class="ships_header">All Available Ships:</h2>']
  let zip_line = '<form id="filter"><input type="checkbox" name="zip_line" value="true">Zip Line</input><input type="checkbox" name="kid_friendly" value="true">Kid Friendly</input><input type="checkbox" name="casino" value="true">Casino</input><br><input type="submit" onclick="filterSubmit()"></input></form><br><br>'
  ships.push(zip_line)
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
