require "monban/constraints/signed_in"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :home
  end
  root "homes#show"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resource :dashboard, only: [:show]
end
