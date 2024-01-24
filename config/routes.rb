Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ('/')
  root 'forums#index'

  # /forums/forum-slug/sub-forum-slug/topic-slug
  # eg: /forums/music/ambient-experimental/sigur-ros
  # overwriting the path to achieve this structure of url
  # resources :forums, param: :slug do
  #   resources :sub_forums, path: '/', param: :slug do
  #     # resources :topics, path: 'topic', param: :slug
  #   end
  # end

  # get '/forums/:forum_slug/:sub_forum_slug/:slug', to: 'topics#show', as: :forum_sub_forum_topic


  resources :forums, param: :slug, path: 'forums'
  get '/forums/:forum_slug', to: 'sub_forums#index', as: :forum_sub_forums
  get '/forums/:forum_slug/:sub_forum_slug', to: 'sub_forums#show', as: :forum_sub_forum
  get '/forums/:forum_slug/:sub_forum_slug/edit', to: 'sub_forums#edit', as: :edit_forum_sub_forum

  # Topics
  get '/forums/:forum_slug/:sub_forum_slug', to: 'topics#index', as: :forum_sub_forum_topics
  get '/forums/:forum_slug/:sub_forum_slug/new', to: 'topics#new', as: :new_forum_sub_forum_topic
  post '/forums/:forum_slug/:sub_forum_slug', to: 'topics#create'

  get '/forums/:forum_slug/:sub_forum_slug/:topic_slug', to: 'topics#show', as: :forum_sub_forum_topic
  get '/forums/:forum_slug/:sub_forum_slug/:topic_slug/edit', to: 'topics#edit', as: :edit_forum_sub_forum_topic
  patch '/forums/:forum_slug/:sub_forum_slug/:topic_slug', to: 'topics#update'
  put '/forums/:forum_slug/:sub_forum_slug/:topic_slug', to: 'topics#update'
  delete '/forums/:forum_slug/:sub_forum_slug/:topic_slug', to: 'topics#destroy'

  post '/forums/:forum_slug/:sub_forum_slug/:topic_slug/comments', to: 'comments#create', as: :create_topic_comment

end
