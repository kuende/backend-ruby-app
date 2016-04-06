class API::V1::PingAPI < Grape::API
  include API::Concerns::BaseSettings

  get :ping do
    { :ping => :pong }
  end
end
