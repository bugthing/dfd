RSpec.describe Dfd::Contracts::Donors::CreateDonor do
  subject(:result) { described_class.new.call(params) }

  context "when there is no nhs_number" do
    let(:params) { {name: "Fred"} }

    it "is invalid" do
      expect(result).to be_failure
      expect(result.errors[:nhs_number]).to include("is missing")
    end
  end
end
