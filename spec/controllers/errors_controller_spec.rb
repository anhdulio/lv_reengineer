require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do

  describe "GET #not_found" do
    it "returns http success" do
      get :not_found
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #internal_server_error" do
    it "returns http success" do
      get :internal_server_error
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #success" do
    it "returns http success" do
      get :success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #unauthorize" do
    it "returns http success" do
      get :unauthorize
      expect(response).to have_http_status(:success)
    end
  end

end
