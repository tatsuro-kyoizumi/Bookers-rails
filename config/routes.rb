Rails.application.routes.draw do
  root :to => 'info#index'
  get 'info/index'
  # get 'top' => 'root#top'
  # get 'books/index'
  # get 'books/show'
  # get 'books/new'
  # get 'books/edit'
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
