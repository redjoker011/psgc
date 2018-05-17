require "psgc/version"
require "json"

module Psgc
  regions_data   = File.join(File.dirname(__FILE__), "data", "regions.json")
  provinces_data = File.join(File.dirname(__FILE__), "data", "provinces.json")
  cities_data    = File.join(File.dirname(__FILE__), "data", "cities_municipalities.json")

  REGIONS   = JSON.parse(File.read(regions_data))
  PROVINCES = JSON.parse(File.read(provinces_data))
  CITIES    = JSON.parse(File.read(cities_data))

  def self.regions
    REGIONS["data"]
  end

  def self.provinces(region_code:)
    provinces = PROVINCES["data"]
    provinces.select{ |data| data["region_code"] == region_code.to_s }
  end

  def self.cities(province_code:)
    cities = CITIES["data"]
    cities.select{ |data| data["province_code"] == province_code.to_s }
  end
end
