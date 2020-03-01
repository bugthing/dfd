RSpec.describe Dfd::Transactions::Donors::CreateDonor do
  subject(:result) { described_class.new(donor_repo: donor_repo).call(params) }

  let(:donor_repo) { double(Dfd::Repos::DonorRepo) }
  let(:donor) { Dfd::Donor.new(id: 1, name: "Joe", nhs_number: "123XYZ") }

  context "with valid params" do
    let(:params) do
      {name: "Bigg",
       nhs_number: "000XYZ",}
    end

    it "using data from valid contract, gets repo creates a donor" do
      expect(donor_repo).to receive(:create).and_return(donor)
      expect(result).to be_success
      expect(result.success).to eq(donor)
    end
  end

  context "with invalid params" do
    let(:params) { {name: "Marti"} }

    it "does not create a donor" do
      expect(donor_repo).not_to receive(:create)
      expect(result).to be_failure
      expect(result.failure.errors[:nhs_number]).to include("is missing")
    end
  end
end
