module Dfd
  module Web
    module Controllers
      module Root
        class Index
          include Hanami::Action
          include Dry::Monads[:result]

          def call(params)
            path     = Hanami::View.configuration.root.join('root/index.html.erb')
            template = Hanami::View::Template.new(path)

            self.body = Dfd::Web::Views::Root::Index.new(template).render
          end
        end
      end
    end
  end
end
