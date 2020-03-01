module Dfd
  module Contracts
    module Donors
      class CreateDonor < Dry::Validation::Contract
        params do
          required(:nhs_number).filled(:string)
          required(:name).filled(:string)
        end
      end
    end
  end
end
