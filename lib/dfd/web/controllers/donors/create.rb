module Dfd
  module Web
    module Controllers
      module Donors
        class Create
          include Hanami::Action
          include Dependencies["transactions.donors.create_donor"]
          include Dry::Monads[:result]

          def call(params)
            case create_donor.call(params.to_h)
            in Success(result)
              self.body = result.to_h.to_json
              self.status = 200
            in Failure(result)
              self.body = { errors: result.errors.to_h }.to_json
              self.status = 422
            end
          end
        end
      end
    end
  end
end
