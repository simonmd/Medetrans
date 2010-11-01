class ReporteAccidente < ActiveRecord::Base
  include Geokit::Geocoders
  validates_presence_of :lat, :lng
  validates_uniqueness_of :twitter_id, :on => :create, :message => "Ya tenemos este tweet"
  before_validation_on_create :geocode_address
  acts_as_mappable :default_units => :kilometers, 
                     :default_formula => :sphere, 
                     :distance_field_name => :distance,
                     :lat_column_name => :lat,
                     :lng_column_name => :long
                    
private

  def geocode_address
    Geokit::Geocoders::request_timeout = 5
    direccion = texto.scan(/\w*_\w*/).join
    med_bounds = GoogleGeocoder.geocode('Medellin, Colombia').suggested_bounds
    geo = GoogleGeocoder.geocode(direccion, :bias => med_bounds)
    errors.add(direccion, "No se pudo geocodificar la direccion") unless geo.success
    self.lat, self.lng = geo.lat, geo.lng if geo.success
  end

end
