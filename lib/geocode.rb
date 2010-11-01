class GeoLocate
  include Geokit::Geocoders
  Geokit::Geocoders::request_timeout = 5
  def geolocate(tweet_array)
    med_bounds = GoogleGeocoder.geocode('Medellin, Colombia').suggested_bounds
    tweet_array.each do |h|
      loc = GoogleGeocoder.geocode(h["direccion"], :bias => med_bounds)
      if loc.success
        h["lat"] = loc.lat
        h["lng"] = loc.lng
      end
    end
    return tweet_array
  end
end