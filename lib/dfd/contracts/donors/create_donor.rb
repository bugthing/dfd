module Dfd
  module Contracts
    module Donors
      class CreateDonor < Dry::Validation::Contract
        params do
          required(:name).filled(:string)
          required(:nhs_number).filled(:string)
        end
      end
    end
  end
end
