Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :lectures do
  member do
    put "like", to: "lectures#upvote"
    put "dislike", to: "lectures#downvote"
    end
  end

  resources :courses
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
