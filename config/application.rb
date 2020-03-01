require_relative "boot"

require "dry/system/container"
require "dry/auto_inject"

module Dfd
  class Application < Dry::System::Container
    configure do |config|
      config.root = File.expand_path("..", __dir__)
      config.default_namespace = "dfd"

      config.auto_register = "lib"
    end

    load_paths!("lib")
  end

  Dependencies = Dry::AutoInject(Application)
end
