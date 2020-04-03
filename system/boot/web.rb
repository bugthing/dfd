Dfd::Application.boot(:web) do |app|
  init do
    require "hanami-router"
    require "hanami-controller"
    require 'hanami/action/session'
    require "hanami-view"
    require "warden"
    require "omniauth-google-oauth2"
  end

  start do
    Hanami::View.configure do
      root 'lib/dfd/web/templates'
      namespace 'Dfd::Web::Views'
      layout :application
    end

    Hanami::View.load!

    Hanami::Controller.configure do
      default_request_format :html

        prepare do
          include Hanami::Action::Session
          include Dfd::Web::Controllers::Authentication
        end
    end
  end
end
