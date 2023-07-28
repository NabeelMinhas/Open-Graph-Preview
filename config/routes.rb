require 'sidekiq/web'

Rails.application.routes.draw do
  root 'previewer#index'
  post 'previewer/process_url', as: 'process_url'
  get 'previewer/preview', as: 'preview'
  mount Sidekiq::Web => '/sidekiq'
end
