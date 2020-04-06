module Dfd
  module Web
    Router = Hanami::Router.new(namespace: Dfd::Web::Controllers) do
      root to: 'root#index'
      post '/donors', to: 'donors#create'

      get '/auth/failure', to: 'session#failure'
      get '/auth/signout', to: 'session#destroy'
      get '/auth/:provider/callback', to: 'session#new'
    end
  end
end
