Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :projects
  # root 'pages#home'

  # Sitemap
  constraints(format: 'xml') do
    get '/sitemap', to: redirect('https://s3.eu-central-1.amazonaws.com/kauntaa/sitemaps/sitemap.xml.gz')
  end
end
