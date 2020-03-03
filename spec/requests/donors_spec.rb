require "web_helper"

RSpec.describe "/donors" do
  context "POST /" do
    context "with valid input" do
      let(:input) do
        {  name: "Drew",
          nhs_number: "XYZ123", }
      end

      it "succeeds" do
        post_json "/donors", input
        expect(last_response.status).to eq(200)
        donor = parsed_body
        expect(donor["id"]).not_to be_nil
        expect(donor["name"]).to eq("Drew")
        expect(donor["nhs_number"]).to eq("XYZ123")
      end
    end

    context "with invalid input" do
      let(:input) do
        { name: "Bobbie" }
      end

      it "returns an error" do
        post_json "/donors", input
        expect(last_response.status).to eq(422)
        user = parsed_body
        expect(user["errors"]["nhs_number"]).to include("is missing")
      end
    end
  end
end
