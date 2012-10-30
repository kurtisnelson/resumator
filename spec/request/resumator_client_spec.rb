require_relative '../spec_helper'
describe Resumator::Client do
  before :all do
    VCR.insert_cassette "request"
  end
  after :all do
    VCR.eject_cassette
  end

  it "is initialized with an API key" do
    client = Resumator::Client.new(ENV['RESUMATOR_TEST_KEY'])
  end

  specify{ expect {client = Resumator::Client.new("")}.to raise_error}

  context "valid client" do
    let(:client) {Resumator::Client.new(ENV['RESUMATOR_TEST_KEY'])}

    describe "#get" do
      it "gets objects" do
        data = client.get "jobs"
        data.count.should > 1
      end

      it "gets specific job" do
        ID = "job_20121030151055_ZK0WBF7NK8WXCWLA"
        data = client.get "jobs", {id: ID}
        data.id.should eq ID
      end

      it "searches by options" do
        data = client.get "jobs", {city: "Pittsburgh"}
        data.city.should eq "Pittsburgh"
      end
    end
  end
end
