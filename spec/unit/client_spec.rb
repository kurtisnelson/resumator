require_relative "../spec_helper"

describe Resumator::Client do
  it "parses an options hash" do
    options = {city: "Atlanta", state: "GA"}
    Resumator::Client.parse_options(options).should eq("/city/Atlanta/state/GA")
  end
end
