Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get :contact, to: 'contacts#new', as: :contact
  post :contact, to: 'contacts#create'

  match '*path' => redirect('/contact'), via: :get
end
