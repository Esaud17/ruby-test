class Api::V1::BalanceController < ApplicationController
  before_action :authenticate_access_key, only: [:validate]

  def validate
    @result = []
    balance_params.each do |item|
       result_status  = Balance.validate(item[:word]) ? 'balanceado' : 'desbalanceado'
       @result.push({ word: item[:word], status: result_status  })
    end
    
    render json: @result, status: :ok
  end
  
  private 
  def balance_params
    params.require(:list)
  end
end
