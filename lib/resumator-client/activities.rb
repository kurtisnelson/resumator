require_relative "../resumator-client"

module Resumator
  class Activities
    StatusChange = Struct.new("StatusChange", :time, :date, :from, :to, :position)
    def initialize(client)
      @client = client
    end

    def status_history(obj_id)
      resp = @client.activities(object_id: obj_id, category: "resume_status")
      resp = [resp] if resp.is_a? Hash # If there is only one activity, it comes back on its own not in an array.
      history = []
      resp.each do |r|
        data = r["action"].scan /"([^"]+)"/
        change = StatusChange.new()
        change.time = r["time"]
        change.date = r["date"]
        change.from = data[0].first
        change.to = data[1].first
        change.position = data[2].first
        history << change
      end
      history
    end
  end
end
