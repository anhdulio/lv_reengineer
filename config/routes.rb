Rails.application.routes.draw do
  devise_for :admins
  #error handing
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  get '/success' => "errors#success"

  resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'website#homepage'
  get 'admin' => 'website#admin', as: 'admin'
  post 'admin/update_price' => 'contents#update_price', as: 'update_price'

  #EN Routing
  get 'blogs' => 'website#blogs', as: 'eblogs'
  get 'abouts' => 'website#abouts', as: 'eabouts'
  get 'products' => 'website#products', as: 'eproducts'
  get 'market' => 'website#market', as: 'emarket'
  get 'contact' => 'website#contact', as: 'econtact'

  #VN Routing
  get 'chia-se-gao' => 'website#blogs', as: 'vblogs'
  get 'gao-loc-van' => 'website#abouts', as: 'vabouts'
  get 'san-pham-gao' => 'website#products', as: 'vproducts'
  get 'thi-truong-gao' => 'website#market', as: 'vmarket'
  get 'lien-he' => 'website#contact', as: 'vcontact'
  get 'gao-chen-com' => 'website#gcc', as: 'gcc'

  scope '/:content_type' do
    resources :contents do
      collection do
        get 'api/:attribute' => 'contents#api'
      end
    end
  end
end
