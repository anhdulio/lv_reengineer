Rails.application.routes.draw do
  get '/_ah/health' => 'website#health'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'website#homepage'
  get 'admin' => 'website#admin', as: 'admin'
  post 'admin/update_price' => 'contents#update_price', as: 'update_price'

  #EN Routing
  get 'blogs' => 'website#blogs', as: 'eblogs'
  get 'abouts' => 'website#abouts', as: 'eabouts'
  get 'products' => 'website#products', as: 'eproducts'
  get 'market' => 'website#market', as: 'emarket'

  #VN Routing
  get 'chia-se-gao' => 'website#blogs', as: 'vblogs'
  get 'gao-loc-van' => 'website#abouts', as: 'vabouts'
  get 'san-pham-gao' => 'website#products', as: 'vproducts'
  get 'thi-truong-gao' => 'website#market', as: 'vmarket'
  scope '/:content_type' do
    resources :contents
  end
end
