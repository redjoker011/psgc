require "test_helper"

class PsgcTest < Minitest::Test
  extend Minitest::Spec::DSL
  let(:regions){ Psgc.regions }

  def test_that_it_has_a_version_number
    refute_nil ::Psgc::VERSION
  end

  describe ".regions" do
    it "returns regions" do
      refute regions.empty?
    end

    it "returns 17 regions" do
      # [ 1] "REGION I (ILOCOS REGION)",
      # [ 2] "REGION II (CAGAYAN VALLEY)",
      # [ 3] "REGION III (CENTRAL LUZON)",
      # [ 4] "REGION IV-A (CALABARZON)",
      # [ 5] "REGION IV-B (MIMAROPA)",
      # [ 6] "REGION V (BICOL REGION)",
      # [ 7] "REGION VI (WESTERN VISAYAS)",
      # [ 8] "REGION VII (CENTRAL VISAYAS)",
      # [ 9] "REGION VIII (EASTERN VISAYAS)",
      # [10] "REGION IX (ZAMBOANGA PENINSULA)",
      # [11] "REGION X (NORTHERN MINDANAO)",
      # [12] "REGION XI (DAVAO REGION)",
      # [13] "REGION XII (SOCCSKSARGEN)",
      # [14] "NATIONAL CAPITAL REGION (NCR)",
      # [15] "CORDILLERA ADMINISTRATIVE REGION (CAR)",
      # [16] "AUTONOMOUS REGION IN MUSLIM MINDANAO (ARMM)",
      # [17] "REGION XIII (Caraga)"
      assert_equal regions.count, 17
    end
  end
  describe ".provinces" do
    it "returns all provinces" do
      refute Psgc.provinces.empty?
    end
  end
  describe ".cities" do
    it "returns all provinces" do
      refute Psgc.cities.empty?
    end
  end
  describe "fetch specific provinces and cities" do
    before do
      @region = regions.first
      @provinces = Psgc.get_provinces_by(region_code: @region["region_code"])
    end

    describe ".get_provinces_by" do
      it "returns provinces of a region" do
        refute @provinces.empty?
      end

      it "returns correct provinces based on region code" do
        assert_equal @region["region_code"], @provinces.last["region_code"]
      end
    end
    describe ".get_cities_munici" do
      before do
        @province = @provinces.last
        @cities = Psgc.get_cities_municipalities_by(province_code: @province["province_code"])
      end

      it "returns cities and municipalities of a province" do
        refute @cities.empty?
      end

      it "returns correct cities and municipalities" do
        assert_equal @province["province_code"], @cities.last["province_code"]
      end
    end
  end
end
