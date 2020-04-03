module Dfd
  module Web
    module Controllers
      module Session
        class Destroy
          include Hanami::Action

          def call(_params)
            warden.logout
            redirect_to "/"
          end
        end
      end
    end
  end
end
