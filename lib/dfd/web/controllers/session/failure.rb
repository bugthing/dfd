module Dfd
  module Web
    module Controllers
      module Session
        class Failure
          include Hanami::Action

          def call(_params)
            status 404, "Not found"
          end
        end
      end
    end
  end
end
