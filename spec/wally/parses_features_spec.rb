require 'wally/parses_features'

describe "Wally::ParsesFeatures" do
  it "parses feature files" do
    feature = "Feature: Do stuff!"
    Wally::ParsesFeatures.new.parse(feature).should == {
      "keyword"     => "Feature",
      "name"        => "Do stuff!",
      "line"        => 1,
      "description" => "",
      "id"          => "do-stuff!",
      "uri"         => nil
    }
  end

  it "raises nice errors" do
    feature = "!WEFFW"
    error = nil
    begin
      Wally::ParsesFeatures.new.parse(feature)
    rescue Exception => e
      error = e
    end
    error.should_not be_nil
  end
end
