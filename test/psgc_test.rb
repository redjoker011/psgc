require "test_helper"

class PsgcTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Psgc::VERSION
  end

  describe ".regions" do
    before { @regions = Psgc.regions }
    it "returns regions" do
      refute @regions.empty?
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
      assert_equal @regions.count, 17
    end
  end
end
