class API::Endpoint < Grape::API
  prefix :api
  mount API::V1
end
