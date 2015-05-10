Rails.application.routes.draw do
  mount_roboto
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :projects
  # root 'pages#home'

  # Sitemap
  constraints(format: 'xml') do
    get '/sitemap', to: redirect('https://s3.eu-central-1.amazonaws.com/ahtung/sitemaps/sitemap.xml.gz')
  end
end
