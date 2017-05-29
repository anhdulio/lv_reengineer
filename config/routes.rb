Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'website#homepage'
  get 'locvan' => 'website#abouts', as: 'abouts'
  get 'blogs' => 'website#blogs', as: 'blogs'
  get 'content' => 'website#content'
  scope '/:content_type' do
    resources :contents
  end
end
