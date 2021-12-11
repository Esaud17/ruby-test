class Api::V1::BalanceController < ApplicationController
  
  def validate
    @result = []
    balance_params.each do |item|
       result_status  = Balance.validate(item[:word]) ? 'balanceado' : 'desbalanceado'
       @result.push({ word: item[:word], status: result_status  })
    end
    
    render json: @result, status: :ok
  end

  def balance_params
    params.require(:list)
  end
end
