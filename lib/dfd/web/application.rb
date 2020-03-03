require "hanami/middleware/body_parser"

module Dfd
  module Web
    def self.app
      Rack::Builder.new do
        use Hanami::Middleware::BodyParser, :json
        run Dfd::Web::Router
      end
    end
  end
end
