Rails.application.routes.draw do

  resources :cotizacions
  resources :proyectos
  resources :servicios
  resources :tipo_servicios
  resources :empleados
  resources :solicituds
  

  resources :clientes do
    resources :cliente_contactos
    get 'autocomplete', on: :collection
  end
  
  resources :events
  resources :visitors
  
  devise_for :users, path: '', path_names: { sign_in: 'ingresar', sign_out: 'salir', sing_up: 'registro'}

   get 'paginas/inicio', as: 'inicio' 

   root to: "paginas#inicio"
end
