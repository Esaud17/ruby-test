module Api
    module V1
        module AuthenticationsHelper

            def auth_header_api_key
                auth_header = request.headers["HTTP-X-API-KEY"]
                if auth_header.nil?
                    raise StandardError.new "HTTP-X-API-KEY is required"
                end
                return auth_header
            end

            def authenticate_access_key
                auth_api_key = auth_header_api_key
                key_access = "m1Qw2LRzUZlWehhinZeR"

                if key_access != auth_api_key
                    raise StandardError.new "HTTP-X-API-KEY No valid key"
                end
            end

        end
    end 
end