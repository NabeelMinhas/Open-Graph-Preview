require 'sidekiq/web'

Rails.application.routes.draw do
  root 'previewer#index'
  post 'previewer/process_url', as: 'process_url'
  mount Sidekiq::Web => '/sidekiq'
end
