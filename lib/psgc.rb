require "psgc/version"

module Psgc
  provinces = File.join(File.dirname(__FILE__), "data", "provinces.json")
  cities    = File.join(File.dirname(__FILE__), "data", "cities_municipalities.json")
  PROVINCE_DATA = JSON.parse(File.read(provinces))
  CITIES_DATA = JSON.parse(File.read(cities))
end
