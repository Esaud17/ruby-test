class ApplicationController < ActionController::API
    include ActionController::Helpers

    include Api::V1::AuthenticationsHelper
end
