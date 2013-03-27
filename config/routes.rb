Sendgrid::Application.routes.draw do
  get "/search" => "pages#search", as: "search"
  post "/mail" => "pages#mail"
  root to: "pages#index"
end
