require "spec_helper"

describe API::V1::PingAPI do
  include ApiMacros

  describe "ping" do
    it "returns 200" do
      api_get "/ping", {}, {}

      expect(last_response.status).to eql(200)
    end

    it "returns pong" do
      api_get "/ping", {}, {}

      with_json_response do |json|
        expect(json).to eql(:ping => "pong")
      end
    end
  end
end
