require_relative "config/application"

Dfd::Application.finalize!

include Dry::Monads[:result]

input = { nhs_number: "999/XXX", name: "Jim Beam" }

create_donor = Dfd::Transactions::Donors::CreateDonor.new
case create_donor.call(input)
when Success
  puts "Donor created successfully!"
when Failure(Dry::Validation::Result)
  puts "Donor creation failed:"
  puts result.failure.errors.to_h
end
