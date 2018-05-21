# Psgc(Philippine Standard Geographic Code) Ruby

The Philippine Standard Geographic Code (PSGC) is a systematic classification
and coding of geographic areas of the Philippines.

It is based on the four well-established hierarchical levels of
geographical-political subdivisions of the country such as the administrative
region, the province, the municipality/city and the barangay.

This Ruby gem provides the PSGC data as a Ruby class library. It can be used in
Rails applications without requiring dedicated database tables.

This gem also contains helper methods for mapping specific region's provinces
and province's cities and municipalities for much more productive development.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'psgc', git: "https://github.com/redjoker011/psgc"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install psgc

## Usage

### Fetch Regions
```ruby
Psgc.regions
```
This will return list of regions including psgc code, region code and region
name

```ruby
[
    [ 0] {
                 "id" => 1,
          "psgc_code" => "010000000",
               "name" => "REGION I (ILOCOS REGION)",
        "region_code" => "01"
    },
    [ 1] {
                 "id" => 2,
          "psgc_code" => "020000000",
               "name" => "REGION II (CAGAYAN VALLEY)",
        "region_code" => "02"
    }
]
```

### Fetch Provinces
```ruby
Psgc.provinces
```
This will return alphabetically sorted list of provinces including psgc code, region code, province
name and province name

```ruby
[
    [0] {
                   "id" => 50,
            "psgc_code" => "097300000",
                 "name" => "ZAMBOANGA DEL SUR",
          "region_code" => "09",
        "province_code" => "0973"
    },
    [1] {
                   "id" => 51,
            "psgc_code" => "098300000",
                 "name" => "ZAMBOANGA SIBUGAY",
          "region_code" => "09",
        "province_code" => "0983"
    }
]
```

### Fetch Cities and Municipalities
```ruby
Psgc.cities_municipalities
```
This will return alphabetically sorted list of cities and municipalities
including psgc code, province code, region code, city/municipality name and
city/municipality code

```ruby
[
    [0] {
                            "id" => 773,
                     "psgc_code" => "063047000",
                          "name" => "ZARRAGA",
                   "region_code" => "06",
                 "province_code" => "0630",
        "city_municipality_code" => "063047"
    },
    [1] {
                            "id" => 1055,
                     "psgc_code" => "086023000",
                          "name" => "ZUMARRAGA",
                   "region_code" => "08",
                 "province_code" => "0860",
        "city_municipality_code" => "086023"
    }
]
```

### Fetch Provinces which belongs to a Specific Region
```ruby
Psgc.get_provinces_by(region_code: chosen_region_code)
```
This will return alphabetically sorted list of provinces including psgc code, region code, province
name and province name which belongs to a specific region

```ruby
# note: argument should be a string
# Fetch provinces of ILOCOS NORTE

Psgc.get_provinces_by(region_code: "01")
[
    [0] {
                   "id" => 3,
            "psgc_code" => "013300000",
                 "name" => "LA UNION",
          "region_code" => "01",
        "province_code" => "0133"
    },
    [1] {
                   "id" => 4,
            "psgc_code" => "015500000",
                 "name" => "PANGASINAN",
          "region_code" => "01",
        "province_code" => "0155"
    }
]
```

### Fetch Cities and Municipalities which belongs to a Specific Province
```ruby
Psgc.get_cities_municipalities_by(province_code: chosen_province_code)
```
This will return alphabetically sorted list of cities and
municipalities including psgc code, region code, city/municipality
name, province code, and city/municipality code 
which belongs to a specific province

```ruby
# note: argument should be a string
# Fetch cities and municipalities of PANGASINAN

Psgc.get_cities_municipalities_by(province_code: "0155")
[
    [0] {
                            "id" => 122,
                     "psgc_code" => "015545000",
                          "name" => "URBIZTONDO",
                   "region_code" => "01",
                 "province_code" => "0155",
        "city_municipality_code" => "015545"
    },
    [1] {
                            "id" => 124,
                     "psgc_code" => "015547000",
                          "name" => "VILLASIS",
                   "region_code" => "01",
                 "province_code" => "0155",
        "city_municipality_code" => "015547"
    }
]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/redjoker011/psgc. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Psgc project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/redjoker011/psgc/blob/master/CODE_OF_CONDUCT.md).
