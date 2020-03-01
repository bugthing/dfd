require "spec_helper"

RSpec.describe Dfd::Repos::DonorRepo do
  context "#create" do
    it "creates a donor" do
      donor = subject.create(
        nhs_number: "999XYZ",
        name: "Jim",
      )

      expect(donor).to be_a(Dfd::Donor)
      expect(donor.id).not_to be_nil
      expect(donor.nhs_number).to eq("999XYZ")
      expect(donor.name).to eq("Jim")
      expect(donor.nhs_code).to eq("999XYZ/Jim")
      expect(donor.created_at).not_to be_nil
      expect(donor.updated_at).not_to be_nil
    end
  end
end
