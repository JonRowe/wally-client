require 'wally/parses_features'

describe "Wally::ParsesFeatures" do
  def output_for string
    Wally::ParsesFeatures.new.parse(string)
  end

  it "parses feature files" do
    feature = "Feature: Do stuff!"
    expect(output_for feature).to eq({
      "keyword"     => "Feature",
      "name"        => "Do stuff!",
      "line"        => 1,
      "description" => "",
      "id"          => "do-stuff!",
      "uri"         => nil
    })
  end

  it "raises nice errors" do
    feature = "!WEFFW"
    error = nil
    expect { output_for feature }.to raise_error Wally::FeatureParseException
  end
end
