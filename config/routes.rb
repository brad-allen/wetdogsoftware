Rails.application.routes.draw do
  
  root :to => "home#index"

  devise_for :accounts
  resources :notifications
  resources :group_actions
  resources :profile_actions
  resources :visibilities
  resources :vote_options
  resources :conversation_invites
  resources :conversation_members
  resources :messages
  resources :group_invites
  resources :group_members
  resources :comments
  resources :connection_invites
  resources :connections

  get :get_page_fields, to: 'pages#get_fields'
  get :get_page_actions, to: 'pages#get_actions'

  get :get_profile_fields, to: 'profiles#get_fields'


  resources :pages do
    get 'posts', to: 'pages#posts', as: 'posts'
    get 'get_fields', to: 'pages#get_fields', as: 'get_fields'
    get 'get_actions', to: 'pages#get_actions', as: 'get_actions'    
  end

  resources :profiles do
    get 'calendar_events', to: 'profiles#calendar_events', as: 'calendar_events'
    get 'comments', to: 'profiles#comments', as: 'comments'
    get 'posts', to: 'profiles#posts', as: 'posts'
    get 'pages', to: 'profiles#pages', as: 'pages'
    get 'connections', to: 'profiles#connections', as: 'connections'
    get 'connection_invites', to: 'profiles#connection_invites', as: 'connection_invites'
    get 'groups', to: 'profiles#groups', as: 'groups'
    get 'owned_groups', to: 'profiles#owned_groups', as: 'owned_groups'
    get 'group_invites', to: 'profiles#group_invites', as: 'group_invites'
    get 'conversations', to: 'profiles#conversations', as: 'conversations'
    get 'conversation_invites', to: 'profiles#conversation_invites', as: 'conversation_invites'
    get 'profile_actions', to: 'profiles#profile_actions', as: 'profile_actions'
  end

  resources :calendar_events do
    get 'notifications', to: 'calendar_events#notifications', as: 'notifications'
  end
  resources :widget_styles do
    get 'vote_options', to: 'widget_styles#vote_options', as: 'vote_options'    
  end
  
  resources :comment_widgets do
    get 'comments', to: 'comment_widgets#comments', as: 'comments'
  end
  resources :posts do
    get 'comment_widget', to: 'posts#comment_widget', as: 'comment_widget'
    get 'comments', to: 'posts#comments', as: 'comments'
  end
  
  resources :conversations do
    get 'messages', to: 'conversations#messages', as: 'conversation_messages'
    get 'members', to: 'conversations#members', as: 'conversation_members'
    get 'invites', to: 'conversations#invites', as: 'conversation_invites'
  end
  
  resources :groups do
    get 'actions', to: 'groups#actions', as: 'group_actions'
    get 'members', to: 'groups#members', as: 'group_members'
    get 'invites', to: 'groups#invites', as: 'group_invites'
    get 'pages', to: 'groups#pages', as: 'pages'
    get 'new_page', to: 'groups#new_page', as: 'new_page'
    
  end
  
  resources :users do
    get 'profiles', to: 'users#profiles', as: 'user_profiles'    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end