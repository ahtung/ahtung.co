Rails.application.routes.draw do
  # Robots
  mount_roboto

  # Users
  devise_for :users

  # Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Home
  resources :projects, only: [:index]
  root 'projects#index'

  # Sitemap
  constraints(format: 'xml') do
    get '/sitemap', to: redirect('https://s3.eu-central-1.amazonaws.com/ahtung/sitemaps/sitemap.xml.gz')
  end
end
