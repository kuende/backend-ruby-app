class AuthService < BaseService
  Contract HashOf[String, String] => Any
  def initialize(headers)
    @headers = headers
  end

  Contract None => Maybe[User]
  def perform
    # NOTE: this method just returns first profile_ref_id in seed list
    # Authentication is not needed for the demo
    User.new(:profile_ref_id => SEED_PROFILE_REF_IDS.first)
  end
end
