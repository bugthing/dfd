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
  end
end
