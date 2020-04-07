Dfd::Application.boot(:web) do |app|
  init do
    require "hanami-router"
    require "hanami-controller"
    require 'hanami/action/session'
    require "hanami-view"
    require 'hanami/assets'
    require "warden"
    require "omniauth-google-oauth2"
  end

  start do
    Hanami::Controller.configure do
      default_request_format :html

      prepare do
        include Hanami::Action::Session
        include Dfd::Web::Controllers::Authentication
      end
    end

    Hanami::View.configure do
      root 'lib/dfd/web/templates'
      namespace 'Dfd::Web::Views'
      layout :application

      prepare do
        include Hanami::Assets::Helpers
      end
    end

    Hanami::View.load!

    Hanami::Assets.configure do
      compile false
      cdn true
      host '0.0.0.0'
      port 9293
    end.load!

  end
end
