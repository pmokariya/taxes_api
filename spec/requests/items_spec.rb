require 'rails_helper'

RSpec.describe "/items", type: :request do

  before(:each) do
    @item_category = FactoryBot.create(:item_category)
  end

  let(:valid_attributes) { {name: "Item 1", rate: "100", item_category_id: @item_category.id}}
  let(:invalid_attributes) { {name: "",rate: "",item_category_id: @item_category.id}}

  let(:valid_headers) {
    {}
  }
  
  before(:each) do
    @item = FactoryBot.create(:item)
  end

  describe "GET /items/order" do
    it "creates a new Item" do
      expect {
        post items_order_url,
             params: { item: {selected_items:[1,2]} }, headers: valid_headers, as: :json
      }
    end
  end


  describe "GET /index" do
    it "renders a successful response" do
      get items_url, headers: valid_headers, as: :json
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get item_url(@item), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Item" do
        expect {
          post items_url,
               params: { item: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Item, :count).by(1)
      end

      it "renders a JSON response with the new Item" do
        post items_url,
             params: { item: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Item" do
        expect {
          post items_url,
               params: { item: invalid_attributes }, as: :json
        }.to change(Item, :count).by(0)
      end

      it "renders a JSON response with errors for the new Item" do
        post items_url,
             params: { item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested Item" do
        patch item_url(@item),
              params: { item: {rate: "200"} }, headers: valid_headers, as: :json
      end

      it "renders a JSON response with the Item" do
        patch item_url(@item),
              params: { item: {rate: "200"} }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the Item" do
        patch item_url(@item),
              params: { item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested Item" do
      expect {
        delete item_url(@item), headers: valid_headers, as: :json
      }.to change(Item, :count).by(-1)
    end
  end
end
