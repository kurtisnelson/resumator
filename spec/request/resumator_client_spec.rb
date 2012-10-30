require_relative '../spec_helper'
describe Resumator::Client do
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
  end
end
