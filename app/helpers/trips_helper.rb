module TripsHelper
  def trip_text_color(trip)
    'text-danger' if trip.canceled?
  end

  def display_links(trip)
    return if trip.canceled?

    if trip.started?
      link_to 'Cancel', trip, method: :delete, class: 'btn btn-danger', id: "cancel-trip-btn-#{trip.id}", remote: true
    else
      link_to('Start', trip, method: :patch, class: 'btn btn-warning mx-1', id: "start-trip-btn-#{trip.id}", remote: true) +
      link_to('Cancel', trip, method: :delete, class: 'btn btn-danger', id: "cancel-trip-btn-#{trip.id}", remote: true)
    end
  end
end
