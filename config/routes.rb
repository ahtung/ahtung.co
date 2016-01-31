Rails.application.routes.draw do
  # Robots
  mount_roboto

  # Users
  devise_for :users

  # Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Sitemap
  constraints(format: 'xml') do
    get '/sitemap', to: redirect('https://s3.eu-central-1.amazonaws.com/ahtung/sitemaps/sitemap.xml.gz')
  end

  # VCard
  get '/vcard', to: 'vcard#new', as: :vcard
  get '/vcard/download/:filename', to: 'vcard#download', as: :vcard_download
  post '/vcard', to: 'vcard#create'

  match '*path', via: :all, to: 'errors#not_found', constraints: CloudfrontConstraint.new
end
