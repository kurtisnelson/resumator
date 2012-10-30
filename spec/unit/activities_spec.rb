require_relative "../spec_helper"

describe Resumator::Activities do
  before :all do
    VCR.insert_cassette "activities"
  end
  after :all do
    VCR.eject_cassette
  end

  subject{Resumator::Activities.new(Resumator::Client.new(ENV['RESUMATOR_TEST_KEY']))}
  describe "#status_history" do
    it "doesn't explode" do
        data = subject.status_history("prospect_20120920202531_GLLJFJ5ES0WFOJFL")
        data.first.from.should_not be nil
        data.first.to.should_not be nil
    end
  end


end
