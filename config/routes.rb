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
  get 'diagnostico', to: 'pages#diagnostico'
  get 'mispacientes', to: 'patients#index', as: :mispacientes
  get 'diagnostico/:patient_id', to: 'pages#diagnostico', as: :diagnostico_patient
  post '/transformar', to: 'degluconversor#transformar'
  get 'degluconversor_tablas', to: 'degluconversor#degluconversor_tablas'



  resources :patients do
    resources :diagnoses, only: [:new, :create, :show, :index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
