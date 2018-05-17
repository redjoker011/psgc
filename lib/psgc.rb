require "psgc/version"
require "json"

module Psgc
  provinces = File.join(File.dirname(__FILE__), "data", "provinces.json")
  cities    = File.join(File.dirname(__FILE__), "data", "cities_municipalities.json")
  PROVINCE_DATA = JSON.parse(File.read(provinces))
  CITIES_DATA = JSON.parse(File.read(cities))

  def self.provinces
    PROVINCE_DATA["data"]
  end

  def self.cities(province_code:)
    cities = CITIES_DATA["data"]
    cities.select{ |data| data["province_code"] == province_code.to_s }
  end
end
