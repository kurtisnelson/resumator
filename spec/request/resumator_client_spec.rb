require_relative '../spec_helper'
describe Resumator::Client do
  before :all do
    VCR.insert_cassette "request"
  end
  after :all do
    VCR.eject_cassette
  end

  it "is initialized with an API key" do
    client = Resumator::Client.new(ENV['RESUMATOR_KEY'])
  end

  specify{ expect {client = Resumator::Client.new("")}.to raise_error}

  context "valid client" do
    let(:client) {Resumator::Client.new(ENV['RESUMATOR_KEY'])}
    
    it "gets jobs" do
      data = client.jobs
      data.count.should > 1
    end

    it "gets specific job" do
      ID = "job_20120813143226_ILMRNXT9G3WBYENQ"
      data = client.jobs(id: ID)
      data.id.should eq ID
    end

    it "searches by options" do
      data = client.jobs(city: "Atlanta")
      data.first.city.should eq "Atlanta"
    end
  end
end
