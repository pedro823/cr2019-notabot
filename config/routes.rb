Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    post '/captcha/generate', to: 'captcha#generate'
    post '/message/create', to: 'message#create'
    get  '/message', to: 'message#all'
    get  '/message/:id', to: 'message#by_id'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
