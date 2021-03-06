require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/item_taxes", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # ItemTax. As you add validations to ItemTax, be sure to
  # adjust the attributes here as well.

  before(:each) do
    @item = FactoryBot.create(:item)
  end

  let(:valid_attributes) { {tax_name: "gst", tax_type: "percentage", tax: "10", item_id: @item.id}}
  let(:invalid_attributes) { {tax_name: "",tax_type: "", tax: "", item_id: @item.id}}

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # ItemTaxsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  before(:each) do
    @item_tax = FactoryBot.create(:item_tax)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get item_taxes_url, headers: valid_headers, as: :json
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get item_tax_url(@item_tax), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ItemTax" do
        expect {
          post item_taxes_url,
               params: { item_tax: valid_attributes }, headers: valid_headers, as: :json
        }.to change(ItemTax, :count).by(1)
      end

      it "renders a JSON response with the new ItemTax" do
        post item_taxes_url,
             params: { item_tax: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ItemTax" do
        expect {
          post item_taxes_url,
               params: { item_tax: invalid_attributes }, as: :json
        }.to change(ItemTax, :count).by(0)
      end

      it "renders a JSON response with errors for the new ItemTax" do
        post item_taxes_url,
             params: { item_tax: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested ItemTax" do
        patch item_tax_url(@item_tax),
              params: { item_tax: {name: "profassional"} }, headers: valid_headers, as: :json
      end

      it "renders a JSON response with the ItemTax" do
        patch item_tax_url(@item_tax),
              params: { item_tax: {name: "profassional"} }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the ItemTax" do
        patch item_tax_url(@item_tax),
              params: { item_tax: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested ItemTax" do
      expect {
        delete item_tax_url(@item_tax), headers: valid_headers, as: :json
      }.to change(ItemTax, :count).by(-1)
    end
  end
end
