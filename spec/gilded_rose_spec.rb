
require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end

  describe "#approval_test" do
    it "produces the same output" do
      golden_standard = File.open("./lib/approval/GoldenStandard.txt").readlines.map(&:chomp)
      current_version = File.open("./lib/approval/CurrentFile.txt").readlines.map(&:chomp)

      expect(golden_standard).to eq(current_version)
    end
  end



end
