require_relative "config/application"

Dfd::Application.finalize!

run Dfd::Web.app
