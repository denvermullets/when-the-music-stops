Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ('/')
  root 'forums#index'

  namespace :admin do
    constraints ->(req) {
      current_user = User.find_by(id: req.session[:user_id])
      current_user&.admin?
    } do
      post 'delete_user/:user_id', to: 'actions#delete_user', as: :delete_user
    end
  end

  # /forums/forum-slug/sub-forum-slug/topic-slug
  # eg: /forums/music/ambient-experimental/sigur-ros
  # overwriting the path to achieve this structure of url

  resources :forums, param: :slug, path: 'forums'
  get '/forums/:forum_slug', to: 'sub_forums#index', as: :forum_sub_forums
  get '/forums/:forum_slug/:sub_forum_slug', to: 'sub_forums#show', as: :forum_sub_forum
  get '/forums/:forum_slug/:sub_forum_slug/edit', to: 'sub_forums#edit', as: :edit_forum_sub_forum

  # given the modified structure, forums/music/genre should show a list of topics instead of a list of forums
  get '/forums/:forum_slug/:sub_forum_slug', to: 'topics#index', as: :forum_sub_forum_topics
  post '/forums/:forum_slug/:sub_forum_slug/topics/new', to: 'topics#create', as: :new_sub_forum_topic
  get '/forums/:forum_slug/:sub_forum_slug/:topic_slug', to: 'topics#show', as: :forum_sub_forum_topic
  get '/forums/:forum_slug/:sub_forum_slug/:topic_slug/edit', to: 'topics#edit', as: :edit_forum_sub_forum_topic
  patch '/forums/:forum_slug/:sub_forum_slug/:topic_slug', to: 'topics#update'
  put '/forums/:forum_slug/:sub_forum_slug/:topic_slug', to: 'topics#update'
  delete '/forums/:forum_slug/:sub_forum_slug/:topic_slug', to: 'topics#destroy'

  post '/forums/:forum_slug/:sub_forum_slug/:topic_slug/comments', to: 'comments#create', as: :create_topic_comment

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'sign-up', to: 'users#new', as: :user_sign_up
  post 'sign-up', to: 'users#create', as: :user_create
  get '/users/profile/:username', to: 'users#show', as: :user_show
  patch '/users/profile/edit/:username', to: 'users#update', as: :user_update
  delete '/users/profile/edit/:username/avatar', to: 'users#delete_avatar', as: :user_delete_avatar
end
