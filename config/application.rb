require_relative "boot"

require "dry/system/container"

module Dfd
  class Application < Dry::System::Container
    configure do |config|
      config.root = File.expand_path('..', __dir__)
      config.default_namespace = 'bix'

      config.auto_register = 'lib'
    end

    load_paths!('lib')
  end
end
