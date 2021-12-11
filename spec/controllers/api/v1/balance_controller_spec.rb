require 'rails_helper'

RSpec.describe Api::V1::BalanceController, type: :request  do

  describe "POST #validate" do
    context "with valid params" do

      it "test case api/v1_balance" do

        post '/api/v1/balance/validate', params: {list:[{word: "test"}]}
        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq('application/json')
      end

    end
  end

end
