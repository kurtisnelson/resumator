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
      response = client.jobs
      response.status.should eq(200)
    end

    it "gets specific job" do
      response = client.jobs(id: "job_20120813143226_ILMRNXT9G3WBYENQ")
      response.status.should eq(200)
    end

    it "searches by options" do
      response = client.jobs(city: "Atlanta")
      response.status.should eq(200)
    end
  end
end
