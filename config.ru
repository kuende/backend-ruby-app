require "./config/boot"

use Rack::Runtime

run API::Endpoint
