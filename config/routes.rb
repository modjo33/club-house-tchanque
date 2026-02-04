Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "pages#home"

  get "/la-carte", to: "pages#carte", as: :carte
  get "/la-carte-des-vins", to: "pages#vins", as: :vins
  get "/la-carte-des-boissons", to: "pages#boissons", as: :boissons
  get "/nos-evenements", to: "pages#evenements", as: :evenements

  # SEO
  get "/sitemap.xml", to: "sitemaps#show", as: :sitemap, defaults: { format: :xml }

  # Admin
  namespace :admin do
    root "dashboard#index"
    resources :site_photos, except: [:show]
    resources :carousel_images, except: [:show]
    resources :menu_items, except: [:show]
    resources :wine_items, except: [:show]
    resources :beverages, except: [:show]
    resources :formulas, except: [:show]
    resources :page_contents, only: [:index, :edit, :update]
    resources :events, except: [:show]
  end
end
