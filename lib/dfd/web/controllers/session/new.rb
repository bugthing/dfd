module Dfd
  module Web
    module Controllers
      module Session
        class New
          include Hanami::Action

          User = Struct.new('User', :email, :name)

          def auth_hash
            request.env['omniauth.auth']
          end

          def call(params)
            user = User.new(*auth_hash['info'].values_at('email', 'name'))
            warden.set_user user
            redirect_to "/"
          end
        end
      end
    end
  end
end
