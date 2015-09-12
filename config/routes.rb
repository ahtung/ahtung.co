Rails.application.routes.draw do
  mount_roboto
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :projects, only: [:index, :show]

  root 'projects#index'

  # Sitemap
  constraints(format: 'xml') do
    get '/sitemap', to: redirect('https://s3.eu-central-1.amazonaws.com/ahtung/sitemaps/sitemap.xml.gz')
  end
end
