Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  get 'pages/index'
  get 'menu', to: 'pages#menu', as: :menu
  get 'degluconversor', to: 'pages#degluconversor'
  get 'escalas', to: 'pages#escalas'
  post 'resultado', to: 'pages#resultado'
  get 'home/fils', to: 'pages#fils'
  get 'diagnostico', to: 'pages#diagnostico'
  get 'mispacientes', to: 'patients#index', as: :mispacientes
  get 'diagnostico/:patient_id', to: 'pages#diagnostico', as: :diagnostico_patient

  resources :patients do
    resources :diagnoses, only: [:new, :create, :show, :index] do
      resources :levels, only: [:new, :create]
    end
  end
end



