Rails.application.routes.draw do
  resources :posts do
    member do
      get ':user_id/publish'   => "posts#publish"
      get ':user_id/unpublish' => "posts#unpublish"
    end
  end


  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
