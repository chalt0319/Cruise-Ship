function showPorts(passenger) {
  url = `/passengers/${passenger}/ports`
  $.get(url, function (ports) {
    $(".ports_link").hide()
    $(".ports").append("<h3>Your Ports:</h3>")
    ports.forEach(function (port) {
      $(".ports").append(`<span>${port.location}</span><br>`)
    })
  })
}
