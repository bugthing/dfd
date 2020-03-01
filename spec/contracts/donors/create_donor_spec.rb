RSpec.describe Dfd::Contracts::Donors::CreateDonor do
  subject(:result) { described_class.new.call(params) }

  context "with valid parameters" do
    let(:params) do
      {name: "Ryan",
       nhs_number: "ABC123",}
    end

    it "is valid" do
      expect(result).to be_success
    end
  end

  context "when there is no nhs_number" do
    let(:params) { {name: "Fred"} }

    it "is invalid" do
      expect(result).to be_failure
      expect(result.errors[:nhs_number]).to include("is missing")
    end
  end

  context "when there is no name" do
    let(:params) { {nhs_number: "ABC123"} }

    it "is invalid" do
      expect(result).to be_failure
      expect(result.errors[:name]).to include("is missing")
    end
  end
end
