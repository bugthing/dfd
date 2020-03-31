module Dfd
  module Web
    module Controllers
      module Root
        class Index
          include Hanami::Action

          def call(params)
            self.body = Views::Root::Index.render(format: format, params: params)
          end
        end
      end
    end
  end
end
