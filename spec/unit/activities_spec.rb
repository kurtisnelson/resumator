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
      if data.count > 0
        data.first.from.should_not be nil
        data.first.to.should_not be nil
      end
    end

    it "can handle an empty response" do
      Resumator::Client.any_instance.stub(:activities) { [] }
      data = subject.status_history("stupidValue")
      data.count.should be 0
    end

    it "can handle a hash response" do
      Resumator::Client.any_instance.stub(:activities) { {"action" => "\"Word\" space \"More\" space \"Cool Job\"", "time" => "noon", "date" => "yesterday"} }
      data = subject.status_history("badValue")
      data.first.time.should eq "noon"
    end
  end


end
