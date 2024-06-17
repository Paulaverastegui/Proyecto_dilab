Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  get 'pages/index'
  get 'menu', to: 'pages#menu', as: :menu
  get 'degluconversor', to: 'pages#degluconversor'
  get 'escalas', to: 'pages#escalas'
  post 'resultado', to: 'pages#resultado'
  get 'home/fils', to: 'pages#fils'
  get 'home/fois', to: 'pages#fois'
  get 'home/doss', to: 'pages#doss'
  
  # Eliminar o comentar la ruta antigua de diagnóstico
  # get 'diagnostico', to: 'pages#diagnostico'
  # get 'diagnostico/:patient_id', to: 'pages#diagnostico', as: :diagnostico_patient
  
  get 'mispacientes', to: 'patients#index', as: :mispacientes
  post '/transformar', to: 'degluconversor#transformar'
  post '/enviar', to: 'degluconversor#enviar'
  post '/especificar', to: 'degluconversor#especificar'
  resources :diagnoses, only: [:index]
  resources :patients do
    resources :diagnoses, only: [:new, :create, :show, :index] do
      resources :levels, only: [:new, :create]
      get 'intermediate_view', on: :member # Ruta para la vista intermedia
      resources :guss_scales, only: [:new, :create, :edit, :update, :show] do
        member do
          get 'intermediate_view'
        end
      end
    end
  end

  resources :guss_scales, only: [:show]
end




