# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Ship has_many Passengers)
- [x] Include at least one belongs_to relationship (Passenger belongs_to Ship)
- [x] Include at least one has_many through relationship (Passenger has_many Excursions through: passenger_excursions)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (You can add Excursions to a Passenger's excursions, e.g. passenger.excursions)
- [x] Include reasonable validations for simple model objects (You cannot create a Passenger without a name, password, and ship)
- [x] Include a class level ActiveRecord scope method (model: Ship, url: /ships/largest_ship)
- [x] Include signup (Can sign up)
- [x] Include login (Can login)
- [x] Include logout (Can logout)
- [x] Include third party signup/login (Can login through Facebook via OmniAuth)
- [x] Include nested resource show or index (url: /passengers/:passenger_id/excursions/:id)
- [x] Include nested resource "new" form (url: /passengers/:passenger_id/excursions/new)
- [x] Include form display of validation errors (url: passengers/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
