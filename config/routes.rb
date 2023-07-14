Rails.application.routes.draw do
  root 'previewer#index'
  post 'previewer/process_url', as: 'process_url'
end
