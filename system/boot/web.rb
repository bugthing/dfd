Dfd::Application.boot(:web) do |app|
  init do
    require "hanami-router"
    require "hanami-controller"
    require "hanami-view"
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
    end
  end
end
