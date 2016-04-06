class GCMService < BaseService
  Contract String, Hash => Any
  def initialize(profile_ref_id, payload)
    @profile_ref_id = profile_ref_id
    @payload = payload
  end

  Contract None => Any
  def perform
    sleep 1
    puts "Push notification sent to #{@profile_ref_id}"
  end
end
