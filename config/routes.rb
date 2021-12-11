Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        post "balance/validate", to: "balance#validate", as: "validate"
    end
  end
 
  mount Rswag::Ui::Engine => "/api/docs"
  mount Rswag::Api::Engine => "/api/docs"

  root to: redirect("/api/docs", status: 302)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
