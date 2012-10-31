require_relative "../spec_helper"

describe Resumator::Client do
  it "parses an options hash" do
    options = {city: "Atlanta", state: "GA"}
    Resumator::Client.parse_options(options).should eq("/city/Atlanta/state/GA")
  end

  it "turns a single hash into a mash array" do
    data = {id: 1, name: "Bob"}
    mash = Resumator::Client.mash(data)
    mash.first.id.should eq 1
    mash.first.name.should eq "Bob"
  end

  it "turns an array of hashes into a mash array" do
    data = [{id: 1, name: "Bob"}, {id: 2, name: "Alice"}]
    mash = Resumator::Client.mash(data)
    mash[0].id.should eq 1
    mash[1].id.should eq 2
  end
end
