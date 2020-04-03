require "hanami/middleware/body_parser"

module Dfd
  module Web
    def self.app
      Rack::Builder.new do
        use Hanami::Middleware::BodyParser, :json
        use Rack::Session::Cookie, secret: SecureRandom.hex(64)
        use Warden::Manager do |manager|
          manager.failure_app = Dfd::Web::Controllers::Session::Failure.new
        end
        use OmniAuth::Builder do
          provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], skip_jwt: true
        end

        run Dfd::Web::Router
      end
    end
  end
end
