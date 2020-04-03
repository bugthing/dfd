module Dfd
  module Web
    module Controllers
      module Session
        class New
          include Hanami::Action

          def auth_hash
            request.env["omniauth.auth"]
          end

          def call(params)
            # user = find_user(auth_hash)
            # warden.set_user user
            redirect_to "/"
          end

          def warden
            request.env["warden"]
          end
        end
      end
    end
  end
end
