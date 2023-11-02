Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
    root "splash#index"
    resources :categories do
      resources :expenses
    end
  end
end
