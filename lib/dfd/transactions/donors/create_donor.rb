module Dfd
  module Transactions
    module Donors
      class CreateDonor
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)
        include Dependencies["contracts.donors.create_donor"]
        include Dependencies["repos.donor_repo"]

        def call(input)
          values = yield validate(input)
          user = yield persist(values)

          Success(user)
        end

        def validate(input)
          create_donor.call(input).to_monad
        end

        def persist(result)
          Success(donor_repo.create(result.values))
        end
      end
    end
  end
end
